Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68413CE3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 21:50:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yfbQ4lkBzDqB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 07:50:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net;
 envelope-from=alexandre@ghiti.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ghiti.fr
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yfYS4fdJzDq9j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 07:48:26 +1100 (AEDT)
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.12] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alexandre@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 161D1240002;
 Wed, 15 Jan 2020 20:48:18 +0000 (UTC)
From: Alexandre Ghiti <alexandre@ghiti.fr>
Subject: Re: linux-next: build warning after merge of the bpf-next tree
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Zong Li <zong.li@sifive.com>
References: <a367af4d-7267-2e94-74dc-2a2aac204080@ghiti.fr>
 <20191018105657.4584ec67@canb.auug.org.au>
 <20191028110257.6d6dba6e@canb.auug.org.au>
 <mhng-0daa1a90-2bed-4b2e-833e-02cd9c0aa73f@palmerdabbelt-glaptop>
 <d5d59f54-e391-3659-d4c0-eada50f88187@ghiti.fr>
 <CANXhq0pn+Nq6T5dNyJiB6xvmqTnPSzo8sVfqHhGyWUURY+1ydg@mail.gmail.com>
 <CAADnVQ+kbxpw7fxRZodTtE7AmEmRDgO9fcmMD8kKRssS8WJizA@mail.gmail.com>
Message-ID: <6c03d212-775c-cddb-b0d0-d7b00571694b@ghiti.fr>
Date: Wed, 15 Jan 2020 15:48:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAADnVQ+kbxpw7fxRZodTtE7AmEmRDgO9fcmMD8kKRssS8WJizA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Network Development <netdev@vger.kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Alexei Starovoitov <ast@kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/14/20 6:23 AM, Alexei Starovoitov wrote:
> On Sun, Jan 12, 2020 at 8:33 PM Zong Li<zong.li@sifive.com>  wrote:
>> I'm not quite familiar with btf, so I have no idea why there are two
>> weak symbols be added in 8580ac9404f6 ("bpf: Process in-kernel BTF")
> I can explain what these weak symbols are for, but that won't change
> the fact that compiler or linker are buggy. The weak symbols should work
> in all cases and compiler should pick correct relocation.
> In this case it sounds that compiler picked relative relocation and failed
> to reach zero from that address.

Sorry for the response delay: I now agree that there is nothing weird 
about those
relocations. All compiler/linker I took a look at (arm64, ppc64 and 
riscv64) correctly
emit an absolute relocation to the address 0 in case of a weak 
unresolved symbol,
so there's no buggy compiler/linker.

And regarding ppc warning, the kernel being compiled as -pie, the 
scripts looks
for absolute relocations which it considers as "bad", except for one 
that is known
to be weak and that is ignored: I have just sent a patch to fix this 
script so that weak
undefined symbol relocations are not considered as bad.

Thanks,

Alex


