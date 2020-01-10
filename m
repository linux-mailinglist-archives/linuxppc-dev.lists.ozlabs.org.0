Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DBF1379F0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 00:01:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vdld0K6DzDqfc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2020 10:01:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.178.242; helo=mslow2.mail.gandi.net;
 envelope-from=alexandre@ghiti.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ghiti.fr
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vd4R4jdKzDqgD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2020 09:31:16 +1100 (AEDT)
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id AF6993ACEDB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 22:28:56 +0000 (UTC)
Received: from [192.168.0.12] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alexandre@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2EFE3240002;
 Fri, 10 Jan 2020 22:28:18 +0000 (UTC)
Subject: Re: Re: linux-next: build warning after merge of the bpf-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>,
 Networking <netdev@vger.kernel.org>
References: <20191018105657.4584ec67@canb.auug.org.au>
 <20191028110257.6d6dba6e@canb.auug.org.au>
From: Alexandre Ghiti <alexandre@ghiti.fr>
Message-ID: <a367af4d-7267-2e94-74dc-2a2aac204080@ghiti.fr>
Date: Fri, 10 Jan 2020 17:28:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028110257.6d6dba6e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: sv-FI
X-Mailman-Approved-At: Sat, 11 Jan 2020 09:59:57 +1100
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
Cc: zong.li@sifive.com, Linux Next Mailing List <linux-next@vger.kernel.org>,
 ppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi guys,

On 10/27/19 8:02 PM, Stephen Rothwell wrote:
> Hi all,
>
> On Fri, 18 Oct 2019 10:56:57 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> Hi all,
>>
>> After merging the bpf-next tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>>
>> WARNING: 2 bad relocations
>> c000000001998a48 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_start
>> c000000001998a50 R_PPC64_ADDR64    _binary__btf_vmlinux_bin_end
>>
>> Introduced by commit
>>
>>    8580ac9404f6 ("bpf: Process in-kernel BTF")
> This warning now appears in the net-next tree build.
>
>
I bump that thread up because Zong also noticed that 2 new relocations for
those symbols appeared in my riscv relocatable kernel branch following 
that commit.

I also noticed 2 new relocations R_AARCH64_ABS64 appearing in arm64 kernel.

Those 2 weak undefined symbols have existed since commit
341dfcf8d78e ("btf: expose BTF info through sysfs") but this is the fact
to declare those symbols into btf.c that produced those relocations.

I'm not sure what this all means, but this is not something I expected 
for riscv for
a kernel linked with -shared/-fpie. Maybe should we just leave them to 
zero ?

I think that deserves a deeper look if someone understands all this 
better than I do.

Alex

