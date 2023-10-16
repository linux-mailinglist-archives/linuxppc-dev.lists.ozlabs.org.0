Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC087CA8E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 15:09:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EKtJU90i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8HX13r0Dz3cPJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 00:09:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EKtJU90i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8HW52My4z2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 00:09:04 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39GD4agF006214;
	Mon, 16 Oct 2023 13:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=7oxjiVGeTw8v6T+3aC9UcrB4WFNbrNAa/1hHvEtdoFY=;
 b=EKtJU90iK1K/f1uOjmdrWNhKS+fCMGt77nIP+KXApC3PsAG/QvSG4kqFrdGQehrMBumL
 dENrCnuWMUbevjntOc3DfyKBeSqm83QD5Ai5V0sp1cnIk+CvNuK08l8c9gaJgaNfQry1
 0EyhdKzHJNjW4y9XZRnydiX+8tYHV0sB2682wz1uiCubPcjjN0jYWiAUO2D+f2wrFMTK
 817I0EZdvFo3meV9fPTdWY7EiQxPXcMfLwwDA2rEF8e9dTraoTJX0hVJFs+MKcgw0oHb
 FmcntcBKNsR5ckYOeTALJAkA+5PVr7ayMJfiCCcXcNRSKpT7t29uYZIQwxSyFHdZL4L1 DA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ts5r7073j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 13:08:56 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39GD4gDM006901;
	Mon, 16 Oct 2023 13:07:22 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ts5r703gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 13:07:22 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39GAKxKT027157;
	Mon, 16 Oct 2023 13:02:38 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr6tk0qkf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 13:02:38 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39GD2bNW50201034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Oct 2023 13:02:38 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9F6F58058;
	Mon, 16 Oct 2023 13:02:37 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A276458061;
	Mon, 16 Oct 2023 13:02:37 +0000 (GMT)
Received: from localhost (unknown [9.61.67.144])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Oct 2023 13:02:37 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v2 3/7] powerpc/rtas: serialize ibm,get-vpd service with
 papr-vpd sequences
In-Reply-To: <20231013-papr-sys_rtas-vs-lockdown-v2-3-ead01ce01722@linux.ibm.com>
References: <20231013-papr-sys_rtas-vs-lockdown-v2-0-ead01ce01722@linux.ibm.com>
 <20231013-papr-sys_rtas-vs-lockdown-v2-3-ead01ce01722@linux.ibm.com>
Date: Mon, 16 Oct 2023 08:02:37 -0500
Message-ID: <87pm1evhxu.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vtt6oF3hB5qc67u8WwM1I3WUEiKiJun6
X-Proofpoint-GUID: vLUv97goh-vDk-u3AlrkfjkmVzGiGvdw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_06,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=525 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310160114
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
Cc: tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> Take the papr-vpd driver's internal mutex when sys_rtas performs
> ibm,get-vpd calls. This prevents sys_rtas(ibm,get-vpd) calls from
> interleaving with sequences performed by the driver, ensuring that
> such sequences are not disrupted.

....

> @@ -1861,6 +1862,28 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>  		goto copy_return;
>  	}
>  
> +	if (token == rtas_function_token(RTAS_FN_IBM_GET_VPD)) {
> +		/*
> +		 * ibm,get-vpd potentially needs to be invoked
> +		 * multiple times to obtain complete results.
> +		 * Interleaved ibm,get-vpd sequences disrupt each
> +		 * other.
> +		 *
> +		 * /dev/papr-vpd doesn't have this problem and users
> +		 * do not need to be aware of each other to use it
> +		 * safely.
> +		 *
> +		 * We can prevent this call from disrupting a
> +		 * /dev/papr-vpd-initiated sequence in progress by
> +		 * reaching into the driver to take its internal
> +		 * lock. Unfortunately there is no way to prevent
> +		 * interference in the other direction without
> +		 * resorting to even worse hacks.
> +		 */
> +		pr_notice_once("Calling ibm,get-vpd via sys_rtas is allowed but deprecated. Use /dev/papr-vpd instead.\n");
> +		papr_vpd_mutex_lock();
> +	}
> +
>  	buff_copy = get_errorlog_buffer();
>  
>  	raw_spin_lock_irqsave(&rtas_lock, flags);
> @@ -1870,6 +1893,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>  	do_enter_rtas(&rtas_args);
>  	args = rtas_args;
>  
> +	if (token == rtas_function_token(RTAS_FN_IBM_GET_VPD))
> +		papr_vpd_mutex_unlock();
> +

The mutex ought to nest entirely outside rtas_lock, this releases it
too early.

Anyway, I'm considering a different way to get the synchronization right
between drivers like papr-vpd and sys_rtas. Instead of having sys_rtas
acquire the driver's internal lock, rtas.c should provide a way for code
like papr-vpd to temporarily lock the syscall path.

Something like this:

// rtas.c

+ static DEFINE_MUTEX(rtas_syscall_lock);
+ void rtas_syscall_lock(void) { mutex_lock(&rtas_syscall_lock); }
+ void rtas_syscall_unlock(void) { mutex_unlock(&rtas_syscall_lock); }

  SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
  {
+        rtas_syscall_lock();

         ...

         do_enter_rtas(&rtas_args);

         ...

+        rtas_syscall_unlock();

         return 0;
  }

// papr-vpd.c

  static void vpd_sequence_begin(struct vpd_sequence *seq,
                                 const struct papr_location_code *loc_code)
  {
          static struct papr_location_code static_loc_code;
          papr_vpd_mutex_lock();
+         rtas_syscall_lock();
          static_loc_code = *loc_code;
          *seq = (struct vpd_sequence) {
                  .params = {
                          .work_area = rtas_work_area_alloc(SZ_4K),
                          .loc_code = &static_loc_code,
                          .sequence = 1,
                  },
          };
  }

  /**
   * vpd_sequence_end() - Finalize a VPD retrieval sequence.
   * @seq: Sequence state.
   *
   * Releases resources obtained by vpd_sequence_begin().
   */
  static void vpd_sequence_end(struct vpd_sequence *seq)
  {
          rtas_work_area_free(seq->params.work_area);
+         rtas_syscall_unlock();
          papr_vpd_mutex_unlock();
  }


This is a sketch to communicate the idea. The locking in the real code
could be finer, perhaps a mutex per RTAS function.
