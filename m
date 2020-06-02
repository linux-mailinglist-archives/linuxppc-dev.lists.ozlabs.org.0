Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CAD1EB9FB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 13:01:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bpyW6H5DzDqVd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 21:01:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49bpwb1KvhzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 21:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ycmg+Niq; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49bpwZ1x4Zz9sSf;
 Tue,  2 Jun 2020 21:00:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591095614;
 bh=DhxXv+xjm6xZfn7LCNIfX94B+FHTlGaJbWoNNuGqJho=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ycmg+NiqHj27V5eQzPg1boDh0bIvIzTsJkLJyvWS2K2Tq1tenNHE9zsVSVMnNuxaw
 Bv/8XERam7hOlupB8SqJDs7EGIgwtdNEBEjwDiAYQhNfTnpSfbFHGdgduf+rfslA5H
 MTFiYUnCFGQDeFblSW4B/SRtaUSM+9smMfh7s9Ivs4gqmj8tlGmkLmLraQcw286hhQ
 YhM9Qq1Z3OsalAtWFoS2KF/1O/xdFz+Q25VOOiQhDG3vx1eW2yuqapoT/evkLqYRrW
 30fkE7F4bGKybz7lRbIZGNhXBfY6q4BeHT/S+aqclB6kNOje2DSu1tqEb02r42Yu7a
 CekUVydCcscHw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] hw_breakpoint: Fix build warnings with clang
In-Reply-To: <0217bbaf-a831-8aea-3ecd-fa217fca1669@csgroup.eu>
References: <20200602041208.128913-1-ravi.bangoria@linux.ibm.com>
 <0217bbaf-a831-8aea-3ecd-fa217fca1669@csgroup.eu>
Date: Tue, 02 Jun 2020 21:00:39 +1000
Message-ID: <87d06hivfs.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: christophe.leroy@c-s.fr, apopple@linux.ibm.com, mikey@neuling.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 02/06/2020 =C3=A0 06:12, Ravi Bangoria a =C3=A9crit=C2=A0:
>> kbuild test robot reported few build warnings with hw_breakpoint code
>> when compiled with clang[1]. Fix those.
>>=20
>> [1]: https://lore.kernel.org/linuxppc-dev/202005192233.oi9CjRtA%25lkp@in=
tel.com/
>>=20

This should have mentioned that some of the errors were recently
introduced by your commit.

>> Reported-by: kbuild test robot <lkp@intel.com>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>> Note: Prepared on top of powerpc/next.
>>=20
>>   arch/powerpc/include/asm/hw_breakpoint.h | 3 ---
>>   include/linux/hw_breakpoint.h            | 4 ++++
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/inc=
lude/asm/hw_breakpoint.h
>> index f42a55eb77d2..cb424799da0d 100644
>> --- a/arch/powerpc/include/asm/hw_breakpoint.h
>> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
>> @@ -70,9 +70,6 @@ extern int hw_breakpoint_exceptions_notify(struct noti=
fier_block *unused,
>>   						unsigned long val, void *data);
>>   int arch_install_hw_breakpoint(struct perf_event *bp);
>>   void arch_uninstall_hw_breakpoint(struct perf_event *bp);
>> -int arch_reserve_bp_slot(struct perf_event *bp);
>> -void arch_release_bp_slot(struct perf_event *bp);
>> -void arch_unregister_hw_breakpoint(struct perf_event *bp);
>>   void hw_breakpoint_pmu_read(struct perf_event *bp);
>>   extern void flush_ptrace_hw_breakpoint(struct task_struct *tsk);
>>=20=20=20
>> diff --git a/include/linux/hw_breakpoint.h b/include/linux/hw_breakpoint=
.h
>> index 6058c3844a76..521481f0d320 100644
>> --- a/include/linux/hw_breakpoint.h
>> +++ b/include/linux/hw_breakpoint.h
>> @@ -80,6 +80,10 @@ extern int dbg_reserve_bp_slot(struct perf_event *bp);
>>   extern int dbg_release_bp_slot(struct perf_event *bp);
>>   extern int reserve_bp_slot(struct perf_event *bp);
>>   extern void release_bp_slot(struct perf_event *bp);
>> +extern int hw_breakpoint_weight(struct perf_event *bp);
>> +extern int arch_reserve_bp_slot(struct perf_event *bp);
>> +extern void arch_release_bp_slot(struct perf_event *bp);
>> +extern void arch_unregister_hw_breakpoint(struct perf_event *bp);
>
> Please no new 'extern'. In the old days 'extern' keyword was used, but=20
> new code shall not introduce new unnecessary usage of 'extern' keyword.=20
> See report from Checkpatch below:
>
> WARNING:COMMIT_LOG_LONG_LINE: Possible unwrapped commit description=20
> (prefer a maximum 75 chars per line)
> #9:
> [1]:=20
> https://lore.kernel.org/linuxppc-dev/202005192233.oi9CjRtA%25lkp@intel.co=
m/
>
> CHECK:AVOID_EXTERNS: extern prototypes should be avoided in .h files
> #40: FILE: include/linux/hw_breakpoint.h:83:
> +extern int hw_breakpoint_weight(struct perf_event *bp);

I fixed it up when applying.

cheers
