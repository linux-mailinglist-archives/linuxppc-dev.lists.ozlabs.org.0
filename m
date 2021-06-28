Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AA03B6992
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 22:16:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDJlS1NGVz3bbm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 06:16:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XuA5IVPq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XuA5IVPq; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDJkw5nV0z30C9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 06:15:34 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id a7so5717573pga.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 13:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=g8OHTYsmEmpeArzf73iQnvarKNYyOlrdRezNFbUEUao=;
 b=XuA5IVPqnYTHx2sZnROHapccrvB4engPDTS6lHR9DDMBjBHbt2fNB+2VHzrS3Kdt7r
 NPiBOvXFPUd/BDgoBO4ZP4knn8BQi2NKcOQRc4G8zTTxRJD77vXQ2ioJWCzliDQmrqP8
 G0gSbz0oaUyNrfxWoaDoSmMiPYLC07HZ3WU98n7EDYsJZEaBs1lYjkKOwhBejea3Cvmm
 DFNltjfkJ3ELr7gh83VDxVCbRyt70Utr0iLcfN0J+Uny+5gGhPItRoDgCF7QB4GgLPns
 FycMTfnaQyUX0qfgjhlyASpSi/9eBa1lXie7MHLOwSbJVuZCFL0++LOMs4yJBNlaaTOe
 WI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=g8OHTYsmEmpeArzf73iQnvarKNYyOlrdRezNFbUEUao=;
 b=uZSsW/Ka+xvvjdXVy9ywejjxRbJxmv6ZlRPw+8Z1S8J1JuJ6dM5wqfw4w3mzTmJOSm
 XevwAO09f3ocLbJJYyABH3u8it2FlTeet/TzbZ47ABL/iEx5Rlgsw/6KtX+UwGCb45Hz
 y6ODCLF05LT2lvcMlFYaGU+ny4ziW5dO7ydidm0QBeW2LPvnmjP1xYYDyutsULlZmpz1
 tlm9bfKBQaGlDPpy2O86dO+emzfauqAiQb6AyrY8wPMggXZr8RYy9rxNG3jt04eJHJcM
 wDlkYxLXwgg1z92T1S3TJfZZHGuS8GfHtGH2Q/3mGMF58uawB1aPuCS2tWW9zMgLawNP
 cFdw==
X-Gm-Message-State: AOAM533XuXoZButpu+sazu6k3c49u2hxZPcd64tQ9j+izovo8PxEIrCo
 G5MGuIB/i8jpRSOTnHzCwPA=
X-Google-Smtp-Source: ABdhPJziAQ6yLv+jNWso9g909etMWW4rwldR/nAWXIcTcuEu0m75LPo2F/qSDxDFhy98YT213YBjRA==
X-Received: by 2002:aa7:818d:0:b029:303:513c:b2c with SMTP id
 g13-20020aa7818d0000b0290303513c0b2cmr20411399pfi.61.1624911331286; 
 Mon, 28 Jun 2021 13:15:31 -0700 (PDT)
Received: from localhost (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id b9sm14306360pfm.124.2021.06.28.13.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 13:15:30 -0700 (PDT)
Date: Tue, 29 Jun 2021 06:15:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/8] powerpc/64: enable MSR[EE] in irq replay pt_regs
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
References: <20210628074932.1499554-1-npiggin@gmail.com>
 <20210628074932.1499554-6-npiggin@gmail.com>
 <2DCB27B7-04A8-461E-B6EA-1E6161CCDA3F@linux.vnet.ibm.com>
In-Reply-To: <2DCB27B7-04A8-461E-B6EA-1E6161CCDA3F@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1624909381.oilxtciopo.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Sachin Sant's message of June 29, 2021 12:37 am:
>=20
>> On 28-Jun-2021, at 1:19 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> Similar to 2b48e96be2f9f ("powerpc/64: fix irq replay pt_regs->softe
>> value"), enable MSR_EE in pt_regs->msr, which makes the regs look a
>> bit more normal and allows the extra debug checks to be added to
>> interrupt handler entry.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> arch/powerpc/include/asm/interrupt.h | 4 ++++
>> arch/powerpc/kernel/irq.c            | 1 +
>> 2 files changed, 5 insertions(+)
>>=20
>> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include=
/asm/interrupt.h
>> index 789311d1e283..d4bdf7d274ac 100644
>> --- a/arch/powerpc/include/asm/interrupt.h
>> +++ b/arch/powerpc/include/asm/interrupt.h
>> @@ -173,6 +173,8 @@ static inline void interrupt_enter_prepare(struct pt=
_regs *regs, struct interrup
>> 			BUG_ON(search_kernel_restart_table(regs->nip));
>> #endif
>> 	}
>> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> +		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));
>> #endif
>=20
> I think this BUG_ON was triggered while running selftests (powerpc/mm/pke=
y_exec_prot)
>=20
> [ 9741.254969] ------------[ cut here ]------------
> [ 9741.254978] kernel BUG at arch/powerpc/include/asm/interrupt.h:177!
> [ 9741.254985] Oops: Exception in kernel mode, sig: 5 [#1]
> [ 9741.254990] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA pSer=
ies
> [ 9741.254995] Modules linked in: rpadlpar_io rpaphp uinput sha512_generi=
c vmac n_gsm pps_ldisc pps_core ppp_synctty ppp_async ppp_generic slcan sli=
p slhc snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore authenc p=
crypt crypto_user n_hdlc dummy veth nfsv3 nfs_acl nfs lockd grace fscache n=
etfs tun brd overlay vfat fat btrfs blake2b_generic xor zstd_compress raid6=
_pq xfs loop sctp ip6_udp_tunnel udp_tunnel dm_mod bonding nft_ct nf_conntr=
ack nf_defrag_ipv6 nf_defrag_ipv4 ip_set rfkill nf_tables libcrc32c nfnetli=
nk sunrpc pseries_rng xts vmx_crypto uio_pdrv_genirq uio sch_fq_codel ip_ta=
bles ext4 mbcache jbd2 sr_mod sd_mod cdrom t10_pi sg ibmvscsi ibmveth scsi_=
transport_srp fuse [last unloaded: test_cpuidle_latency]
> [ 9741.255097] CPU: 17 PID: 3278920 Comm: pkey_exec_prot Tainted: G      =
  W  OE     5.13.0-rc7-next-20210625-dirty #4
> [ 9741.255106] NIP:  c0000000000300d8 LR: c000000000009604 CTR: c00000000=
0009330
> [ 9741.255111] REGS: c0000000347536f0 TRAP: 0700   Tainted: G        W  O=
E      (5.13.0-rc7-next-20210625-dirty)
> [ 9741.255117] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 22004282  =
XER: 20040000
> [ 9741.255130] CFAR: c00000000003007c IRQMASK: 3=20
> [ 9741.255130] GPR00: c000000000093cd0 c000000034753990 c0000000029bbe00 =
c000000034753a30=20
> [ 9741.255130] GPR04: 00007fff9ebb0000 0000000000200000 000000000000000a =
000000000000002d=20
> [ 9741.255130] GPR08: 0000000000000000 0000000000000001 0000000000000000 =
7265677368657265=20
> [ 9741.255130] GPR12: 8000000000021033 c00000001ec27280 0000000000000000 =
0000000000000000=20
> [ 9741.255130] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [ 9741.255130] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010003c40=20
> [ 9741.255130] GPR24: 0000000000000000 0000000000000000 0000000000200000 =
c00000005e89d200=20
> [ 9741.255130] GPR28: 0000000000000300 00007fff9ebb0000 c000000034753e80 =
c000000034753a30=20
> [ 9741.255191] NIP [c0000000000300d8] program_check_exception+0xe8/0x1c0
> [ 9741.255202] LR [c000000000009604] program_check_common_virt+0x2d4/0x32=
0
> [ 9741.255209] Call Trace:
> [ 9741.255212] [c000000034753990] [0000000000000008] 0x8 (unreliable)
> [ 9741.255219] [c0000000347539c0] [c000000034753a80] 0xc000000034753a80
> [ 9741.255225] --- interrupt: 700 at arch_local_irq_restore+0x1d0/0x200
> [ 9741.255231] NIP:  c000000000016790 LR: c000000000093388 CTR: c00000000=
0008780
> [ 9741.255236] REGS: c000000034753a30 TRAP: 0700   Tainted: G        W  O=
E      (5.13.0-rc7-next-20210625-dirty)
> [ 9741.255242] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 24004288  =
XER: 20040000
> [ 9741.255253] CFAR: c0000000000165ec IRQMASK: 0=20
> [ 9741.255253] GPR00: c000000000093cd0 c000000034753cd0 c0000000029bbe00 =
0000000000000000=20
> [ 9741.255253] GPR04: 00007fff9ebb0000 0000000000200000 000000000000000a =
000000000000002d=20
> [ 9741.255253] GPR08: 0000000000000000 0000000000000000 c0000000bd77d400 =
7265677368657265=20
> [ 9741.255253] GPR12: 0000000044000282 c00000001ec27280 0000000000000000 =
0000000000000000=20
> [ 9741.255253] GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
> [ 9741.255253] GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000010003c40=20
> [ 9741.255253] GPR24: 0000000000000000 0000000000000000 0000000000200000 =
c00000005e89d200=20
> [ 9741.255253] GPR28: 0000000000000300 00007fff9ebb0000 c000000034753e80 =
0000000000000001=20
> [ 9741.255313] NIP [c000000000016790] arch_local_irq_restore+0x1d0/0x200
> [ 9741.255319] LR [c000000000093388] ___do_page_fault+0x438/0xb80
> [ 9741.255325] --- interrupt: 700
> [ 9741.255328] [c000000034753cd0] [c00000000009be74] hash_page_mm+0x5e4/0=
x800 (unreliable)
> [ 9741.255335] [c000000034753d00] [000000000000002d] 0x2d
> [ 9741.255340] [c000000034753db0] [c000000000093cd0] hash__do_page_fault+=
0x30/0x70
> [ 9741.255348] [c000000034753de0] [c00000000009c438] do_hash_fault+0x78/0=
xb0

This looks like it's probably running un-reconciled due to the first=20
call to hash__do_page_fault not calling a real interrupt handler. =20
Without this patch, the test must be causing a warning due to the same
thing probably (the bug triggered in the program check interrupt handler).

I think this patch is probably the right fix for it.

Thanks,
Nick

---

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s=
64/hash_utils.c
index 96d9aa164007..ac5720371c0d 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1522,8 +1522,8 @@ int hash_page(unsigned long ea, unsigned long access,=
 unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
=20
-DECLARE_INTERRUPT_HANDLER_RET(__do_hash_fault);
-DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
+DECLARE_INTERRUPT_HANDLER(__do_hash_fault);
+DEFINE_INTERRUPT_HANDLER(__do_hash_fault)
 {
 	unsigned long ea =3D regs->dar;
 	unsigned long dsisr =3D regs->dsisr;
@@ -1533,6 +1533,11 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 	unsigned int region_id;
 	long err;
=20
+	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT))) {
+		hash__do_page_fault(regs);
+		return;
+	}
+
 	region_id =3D get_region_id(ea);
 	if ((region_id =3D=3D VMALLOC_REGION_ID) || (region_id =3D=3D IO_REGION_I=
D))
 		mm =3D &init_mm;
@@ -1571,9 +1576,10 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 			bad_page_fault(regs, SIGBUS);
 		}
 		err =3D 0;
-	}
=20
-	return err;
+	} else if (err) {
+		hash__do_page_fault(regs);
+	}
 }
=20
 /*
@@ -1582,13 +1588,6 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
  */
 DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 {
-	unsigned long dsisr =3D regs->dsisr;
-
-	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_KEYFAULT))) {
-		hash__do_page_fault(regs);
-		return 0;
-	}
-
 	/*
 	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
 	 * don't call hash_page, just fail the fault. This is required to
@@ -1607,8 +1606,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 		return 0;
 	}
=20
-	if (__do_hash_fault(regs))
-		hash__do_page_fault(regs);
+	__do_hash_fault(regs);
=20
 	return 0;
 }
