Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8536F28D784
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 02:34:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9th849x8zDqsd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 11:34:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9tfj0YJSzDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 11:32:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=isquPztE; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4C9tfh3tJDz9sSs;
 Wed, 14 Oct 2020 11:32:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1602635564;
 bh=aaFXn0s8LXNBACeN5QqauoEt7/W0th4b6zZ3+2X5Ur4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=isquPztE8yN6BTroYKarHtiWcECSrsds2PfW2N2BXFJ/sMnRyjkAdRn4f2lsifvzP
 b3Ku6pZMwPgitHT2xtrU9XZ5PtZvri3rfl3IQb5/Y+9CzW6ENl8b5lVCxnv9nxB09j
 4ocFGgbyHb3dfSM7SP40ZX0e3Zg9m+xQvvR7syXC6lnMYOjRiDwR5nqwg8HA0qXj02
 d6j9LprKL/Qvknk5gXlMRSiOy8uNpPR7dU3nf2SB+cpcjTW0SrR7Vl0/7RTxMzfJRq
 dEQRWxoBMzUXZnQ/aqp3gZLuUBLOBE2+zRGo9BHWS9fKihWaHvsKA5XpfJ5ffMbEbq
 4zAcvSHG8fDjw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH 1/2] powerpc: Fix user data corruption with P9N DD2.1 VSX
 CI load workaround emulation
In-Reply-To: <20201013043741.743413-1-mikey@neuling.org>
References: <20201013043741.743413-1-mikey@neuling.org>
Date: Wed, 14 Oct 2020 11:32:43 +1100
Message-ID: <87imbdzlxw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Neuling <mikey@neuling.org> writes:
> __get_user_atomic_128_aligned() stores to kaddr using stvx which is a
> VMX store instruction, hence kaddr must be 16 byte aligned otherwise
> the store won't occur as expected.
>
> Unfortunately when we call __get_user_atomic_128_aligned() in
> p9_hmi_special_emu(), the buffer we pass as kaddr (ie. vbuf) isn't
> guaranteed to be 16B aligned. This means that the write to vbuf in
> __get_user_atomic_128_aligned() has the bottom bits of the address
> truncated. This results in other local variables being
> overwritten. Also vbuf will not contain the correct data which results
> in the userspace emulation being wrong and hence user data corruption.
>
> In the past we've been mostly lucky as vbuf has ended up aligned but
> this is fragile and isn't always true. CONFIG_STACKPROTECTOR in
> particular can change the stack arrangement enough that our luck runs
> out.

Below is a script which takes a System.map and vmlinux (or objdump
output) and tries to check if the stack layout is susceptible to the
bug.

cheers



#!/usr/bin/python3

import os
import sys
import re
from subprocess import Popen, PIPE


# eg: c00000000002ea88:       ce 49 00 7c     stvx    v0,0,r9
stvx_pattern = re.compile('^c[0-9a-f]{15}:\s+(?:[0-9a-f]{2} ){4}\s+stvx\s+v0,0,(r\d+)\s*')

# eg: c00000000002ea80:       28 00 21 39     addi    r9,r1,40
addi_pattern = '^c[0-9a-f]{15}:\s+(?:[0-9a-f]{2} ){4}\s+addi\s+%s,r1,(\d+)\s*'


def main(args):
    if len(args) != 2:
        print('Usage: %s <objdump|vmlinux> <System.map>' % sys.argv[0])
        return -1

    if os.path.basename(sys.argv[1]).startswith('vmlinu'):
        dump = Popen(['objdump', '-d', sys.argv[1]], stdout=PIPE, encoding='utf-8').stdout
    else:
        dump = open(sys.argv[1])

    syms = read_symbols(sys.argv[2])

    func_lines = extract_func(dump, 'handle_hmi_exception', syms)
    if func_lines is None:
        print("Error: couldn't find handle_hmi_exception in objdump output")
        return -1

    match = None
    i = 0
    while i < len(func_lines):
        match = stvx_pattern.match(func_lines[i])
        if match:
            break
        i += 1

    if match is None:
        print("Error: couldn't find stvx in handle_hmi_exception")
        return -1

    stvx_reg = match.group(1)
    print('stvx found using register %s:\n%s\n' % (stvx_reg, match.group(0).rstrip()))

    match = None
    i -= 1
    while i > 0:
        pattern = re.compile(addi_pattern % stvx_reg)
        match = pattern.match(func_lines[i])
        if match:
            break
        i -= 1

    if match is None:
        print("Error: couldn't find addi in handle_hmi_exception")
        return -1

    stack_offset = int(match.group(1))
    print('addi found using offset %d:\n%s\n' % (stack_offset, match.group(0).rstrip()))

    if stack_offset & 0xf:
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
        print('!! Offset is misaligned - bug present !!')
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
        return 1
    else:
        print('OK - offset is aligned')

    return 0


def extract_func(f, func_name, syms):
    func_addr, func_size = find_symbol_and_size(syms, func_name)
    num_lines = int(func_size / 4)

    pattern = re.compile('^%016x:' % func_addr)

    match = None
    line = f.readline()
    while len(line):
        match = pattern.match(line)
        if match:
            break
        line = f.readline()

    if match is None:
        return None

    lines = []
    for i in range(0, num_lines):
        lines.append(f.readline())

    return lines


def read_symbols(map_path):
    last_function = ''
    last_addr = 0

    lines = open(map_path).readlines()

    addrs = []
    last_addr = 0
    for line in lines:
        tokens = line.split()
        if len(tokens) == 3:
            addr = int(tokens[0], 16)
            sym_type = tokens[1]
            name = tokens[2]
        elif len(tokens) == 2:
            addr = last_addr
            sym_type = tokens[0]
            name = tokens[1]
        else:
            raise Exception("Couldn't grok System.map")

        addrs.append((addr, name, sym_type))
        last_addr = addr

    return addrs


def find_symbol_and_size(symbol_map, name):
    dot_name = '.%s' % name
    saddr = None
    i = 0
    for addr, cur_name, sym_type in symbol_map:
        if cur_name == name or cur_name == dot_name:
            saddr = addr
            break
        i += 1

    if saddr is None:
        return (None, None)

    i += 1
    if i >= len(symbol_map):
        size = -1
    else:
        size = symbol_map[i][0] - saddr

    return (saddr, size)


sys.exit(main(sys.argv[1:]))
