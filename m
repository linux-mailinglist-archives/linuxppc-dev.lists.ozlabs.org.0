Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A801757D2B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 15:20:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LOe1gK4P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R501V2Lj1z3dJ4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 23:20:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LOe1gK4P;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R500d5KGrz2xFm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 23:19:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1689686364;
	bh=dFkPjTr4j/o5dl2AwZU6kHQTAigDCbFFJcPknMTfSjc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LOe1gK4PmPFxiVVpqvK6ArsER1zGoKtcIpBF8fF5nDj5DDVScWq/1RU2QntbNqk7X
	 HpPB5mSFIMGk9y5WSBuoPFUEHHRrkM2J45CvOJU2c4yqVmlBB+rqC+GoNad8GiFStA
	 5IbK+CZFXU+rsehNyXKLFUH4d5RV2z+IQ9XwRweeLNfA3z7Ux6xjEj+IXNCU/T0YQn
	 K1cgNImqSBF72W6CsgwLLlybfpN28ds4weH1y5Ci5USinHPfr5A11iT8bjfEwSVYRG
	 TFiG1Mb3Id+18myKTJaRDyCPeCsvEYU/G43IQ3HRpo19AJBUI9GRF2pGMsMTCFWOEv
	 U5NK/JC3HbR8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R500X38fKz4wjG;
	Tue, 18 Jul 2023 23:19:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: mahesh@linux.ibm.com, Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: Kernel Crash Dump (kdump) broken with 6.5
In-Reply-To: <udbe6orsg6jpzkwppupzekfwxjvn7e5q3rlzyqvm4xl3k44w7t@e7m2zjjwmh5c>
References: <AB3C7C5C-86FD-4D86-9330-000CB9728F48@linux.ibm.com>
 <udbe6orsg6jpzkwppupzekfwxjvn7e5q3rlzyqvm4xl3k44w7t@e7m2zjjwmh5c>
Date: Tue, 18 Jul 2023 23:19:23 +1000
Message-ID: <87wmyxich0.fsf@mail.lhotse>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh J Salgaonkar <mahesh@linux.ibm.com> writes:
> On 2023-07-17 20:15:53 Mon, Sachin Sant wrote:
>> Kdump seems to be broken with 6.5 for ppc64le.
>> 
>> [ 14.200412] systemd[1]: Starting dracut pre-pivot and cleanup hook...
>> [[0;32m OK [0m] Started dracut pre-pivot and cleanup hook.
>> Starting Kdump Vmcore Save Service...
>> [ 14.231669] systemd[1]: Started dracut pre-pivot and cleanup hook.
>> [ 14.231801] systemd[1]: Starting Kdump Vmcore Save Service...
>> [ 14.341035] kdump.sh[297]: kdump: saving to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
>> [ 14.350053] EXT4-fs (sda2): re-mounted e971a335-1ef8-4295-ab4e-3940f28e53fc r/w. Quota mode: none.
>> [ 14.345979] kdump.sh[297]: kdump: saving vmcore-dmesg.txt to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
>> [ 14.348742] kdump.sh[331]: Cannot open /proc/vmcore: No such file or directory
>> [ 14.348845] kdump.sh[297]: kdump: saving vmcore-dmesg.txt failed
>> [ 14.349014] kdump.sh[297]: kdump: saving vmcore
>> [ 14.443422] kdump.sh[332]: open_dump_memory: Can't open the dump memory(/proc/vmcore). No such file or directory
>> [ 14.456413] kdump.sh[332]: makedumpfile Failed.
>> [ 14.456662] kdump.sh[297]: kdump: saving vmcore failed, _exitcode:1
>> [ 14.456822] kdump.sh[297]: kdump: saving the /run/initramfs/kexec-dmesg.log to /sysroot//var/crash//127.0.0.1-2023-07-14-13:32:34/
>> [ 14.487002] kdump.sh[297]: kdump: saving vmcore failed
>> [[0;1;31mFAILED[0m] Failed to start Kdump Vmcore Save Service.
>
> Thanks Sachin for catching this.
>
>> 
>> 6.4 was good. Git bisect points to following patch
>> 
>> commit 606787fed7268feb256957872586370b56af697a
>>     powerpc/64s: Remove support for ELFv1 little endian userspace
>> 
>> Reverting this patch allows a successful capture of vmcore.
>> 
>> Does this change require any corresponding change to kdump
>> and/or kexec tools?
>
> Need to investigate that. It looks like vmcore_elf64_check_arch(&ehdr)
> check from fs/proc/vmcore.c is failing after above commit.
>
> static int __init parse_crash_elf64_headers(void)
> {
> [...]
>
>         /* Do some basic Verification. */
>         if (memcmp(ehdr.e_ident, ELFMAG, SELFMAG) != 0 ||
>                 (ehdr.e_type != ET_CORE) ||
>                 !vmcore_elf64_check_arch(&ehdr) ||
> [...]

Where vmcore_elf64_check_arch() calls elf_check_arch(), which was
modified by the commit, so that makes sense.

> It looks like ehdr->e_flags are not set properly while generating vmcore
> ELF header. I see that in kexec_file_load, ehdr->e_flags left set to 0
> irrespective of IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2) is true or false.

Does initialising it in crash_prepare_elf64_headers() fix the issue?

cheers
