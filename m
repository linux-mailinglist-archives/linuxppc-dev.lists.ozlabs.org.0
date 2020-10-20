Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B79293B24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 14:20:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFt4z11BZzDqgd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 23:20:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AsmGa0LJ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFs2M4rD1zDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 22:33:31 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KB3BbP154187; Tue, 20 Oct 2020 07:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pX1h/SmRSMfZc9rkmylR3HhkMKiuay0MiY2iGmKDUQI=;
 b=AsmGa0LJ2DGgSVfd7MlNsZpsayJoNKvYwIJQ18Q4cxdiEBLPFumZ3t1ygKGVQW7PQ0N4
 i0+tSm0gfiXfiv3IwQhOPUsn1jF0smbf4bOxQp0iu0QhDn5jNYoPzWvcvN/iwXR6cKlg
 dvycRZKalt403CFYnZAdNvo671PWowSiOapWF+p98qEODiJpcCbkR8+56eTvwGL8JlC9
 EDPnDX7+94W14pmHn7G4bSrlB5VhMDNFZ3QC/EyElZpsnLf7MeRJCOPFyisDAczUDBMc
 Atl7jVFBfv6wuJQ7IBCmYpMxT6ZXqdPMaM2xhagkoUSWqmVfOaDpUNW7McFl1hOuo4fg Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349xnk91md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 07:33:21 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09KBQNgJ048244;
 Tue, 20 Oct 2020 07:33:21 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 349xnk91k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 07:33:21 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09KBSwDl021703;
 Tue, 20 Oct 2020 11:33:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 347r881mkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 11:33:19 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09KBXH5p34603468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Oct 2020 11:33:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 611CBA4040;
 Tue, 20 Oct 2020 11:33:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBC9DA405B;
 Tue, 20 Oct 2020 11:33:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.211.236])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Oct 2020 11:33:09 +0000 (GMT)
Subject: Re: [PATCH v4] powerpc/pseries: Avoid using addr_to_pfn in real mode
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
References: <20200724063946.21378-1-ganeshgr@linux.ibm.com>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <566dfec7-4574-b518-f55b-5d34ca3bed08@linux.ibm.com>
Date: Tue, 20 Oct 2020 17:03:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724063946.21378-1-ganeshgr@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-20_05:2020-10-20,
 2020-10-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010200074
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
Cc: mahesh@linux.vnet.ibm.com, npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/24/20 12:09 PM, Ganesh Goudar wrote:

> When an UE or memory error exception is encountered the MCE handler
> tries to find the pfn using addr_to_pfn() which takes effective
> address as an argument, later pfn is used to poison the page where
> memory error occurred, recent rework in this area made addr_to_pfn
> to run in real mode, which can be fatal as it may try to access
> memory outside RMO region.
>
> Have two helper functions to separate things to be done in real mode
> and virtual mode without changing any functionality. This also fixes
> the following error as the use of addr_to_pfn is now moved to virtual
> mode.
>
> Without this change following kernel crash is seen on hitting UE.
>
> [  485.128036] Oops: Kernel access of bad area, sig: 11 [#1]
> [  485.128040] LE SMP NR_CPUS=2048 NUMA pSeries
> [  485.128047] Modules linked in:
> [  485.128067] CPU: 15 PID: 6536 Comm: insmod Kdump: loaded Tainted: G OE 5.7.0 #22
> [  485.128074] NIP:  c00000000009b24c LR: c0000000000398d8 CTR: c000000000cd57c0
> [  485.128078] REGS: c000000003f1f970 TRAP: 0300   Tainted: G OE (5.7.0)
> [  485.128082] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 28008284  XER: 00000001
> [  485.128088] CFAR: c00000000009b190 DAR: c0000001fab00000 DSISR: 40000000 IRQMASK: 1
> [  485.128088] GPR00: 0000000000000001 c000000003f1fbf0 c000000001634300 0000b0fa01000000
> [  485.128088] GPR04: d000000002220000 0000000000000000 00000000fab00000 0000000000000022
> [  485.128088] GPR08: c0000001fab00000 0000000000000000 c0000001fab00000 c000000003f1fc14
> [  485.128088] GPR12: 0000000000000008 c000000003ff5880 d000000002100008 0000000000000000
> [  485.128088] GPR16: 000000000000ff20 000000000000fff1 000000000000fff2 d0000000021a1100
> [  485.128088] GPR20: d000000002200000 c00000015c893c50 c000000000d49b28 c00000015c893c50
> [  485.128088] GPR24: d0000000021a0d08 c0000000014e5da8 d0000000021a0818 000000000000000a
> [  485.128088] GPR28: 0000000000000008 000000000000000a c0000000017e2970 000000000000000a
> [  485.128125] NIP [c00000000009b24c] __find_linux_pte+0x11c/0x310
> [  485.128130] LR [c0000000000398d8] addr_to_pfn+0x138/0x170
> [  485.128133] Call Trace:
> [  485.128135] Instruction dump:
> [  485.128138] 3929ffff 7d4a3378 7c883c36 7d2907b4 794a1564 7d294038 794af082 3900ffff
> [  485.128144] 79291f24 790af00e 78e70020 7d095214 <7c69502a> 2fa30000 419e011c 70690040
> [  485.128152] ---[ end trace d34b27e29ae0e340 ]---
>
> Fixes: 9ca766f9891d ("powerpc/64s/pseries: machine check convert to use common event code")
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> V2: Leave bare metal code and save_mce_event as is.
>
> V3: Have separate functions for realmode and virtual mode handling.
>
> V4: Fix build warning, rephrase commit message.
> ---
>   arch/powerpc/platforms/pseries/ras.c | 118 ++++++++++++++++-----------
>   1 file changed, 69 insertions(+), 49 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index f3736fcd98fc..c509e43bac23 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -522,18 +522,55 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
>   	return 0; /* need to perform reset */
>   }
>   
> +static int mce_handle_err_realmode(int disposition, u8 error_type)
> +{
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (disposition == RTAS_DISP_NOT_RECOVERED) {
> +		switch (error_type) {
> +		case	MC_ERROR_TYPE_SLB:
> +		case	MC_ERROR_TYPE_ERAT:
> +			/*
> +			 * Store the old slb content in paca before flushing.
> +			 * Print this when we go to virtual mode.
> +			 * There are chances that we may hit MCE again if there
> +			 * is a parity error on the SLB entry we trying to read
> +			 * for saving. Hence limit the slb saving to single
> +			 * level of recursion.
> +			 */
> +			if (local_paca->in_mce == 1)
> +				slb_save_contents(local_paca->mce_faulty_slbs);
> +			flush_and_reload_slb();
> +			disposition = RTAS_DISP_FULLY_RECOVERED;
> +			break;
> +		default:
> +			break;
> +		}
> +	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
> +		/* Platform corrected itself but could be degraded */
> +		pr_err("MCE: limited recovery, system may be degraded\n");
> +		disposition = RTAS_DISP_FULLY_RECOVERED;
> +	}
> +#endif
> +	return disposition;
> +}
>   
> -static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
> +static int mce_handle_err_virtmode(struct pt_regs *regs,
> +				   struct rtas_error_log *errp,
> +				   struct pseries_mc_errorlog *mce_log,
> +				   int disposition)
>   {
>   	struct mce_error_info mce_err = { 0 };
> -	unsigned long eaddr = 0, paddr = 0;
> -	struct pseries_errorlog *pseries_log;
> -	struct pseries_mc_errorlog *mce_log;
> -	int disposition = rtas_error_disposition(errp);
>   	int initiator = rtas_error_initiator(errp);
>   	int severity = rtas_error_severity(errp);
> +	unsigned long eaddr = 0, paddr = 0;
>   	u8 error_type, err_sub_type;
>   
> +	if (!mce_log)
> +		goto out;
> +
> +	error_type = mce_log->error_type;
> +	err_sub_type = rtas_mc_error_sub_type(mce_log);
> +
>   	if (initiator == RTAS_INITIATOR_UNKNOWN)
>   		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
>   	else if (initiator == RTAS_INITIATOR_CPU)
> @@ -572,18 +609,7 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>   	mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
>   	mce_err.error_class = MCE_ECLASS_UNKNOWN;
>   
> -	if (!rtas_error_extended(errp))
> -		goto out;
> -
> -	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
> -	if (pseries_log == NULL)
> -		goto out;
> -
> -	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
> -	error_type = mce_log->error_type;
> -	err_sub_type = rtas_mc_error_sub_type(mce_log);
> -
> -	switch (mce_log->error_type) {
> +	switch (error_type) {
>   	case MC_ERROR_TYPE_UE:
>   		mce_err.error_type = MCE_ERROR_TYPE_UE;
>   		mce_common_process_ue(regs, &mce_err);
> @@ -683,37 +709,31 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>   		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
>   		break;
>   	}
> +out:
> +	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
> +		       &mce_err, regs->nip, eaddr, paddr);
> +	return disposition;
> +}
>   
> -#ifdef CONFIG_PPC_BOOK3S_64
> -	if (disposition == RTAS_DISP_NOT_RECOVERED) {
> -		switch (error_type) {
> -		case	MC_ERROR_TYPE_SLB:
> -		case	MC_ERROR_TYPE_ERAT:
> -			/*
> -			 * Store the old slb content in paca before flushing.
> -			 * Print this when we go to virtual mode.
> -			 * There are chances that we may hit MCE again if there
> -			 * is a parity error on the SLB entry we trying to read
> -			 * for saving. Hence limit the slb saving to single
> -			 * level of recursion.
> -			 */
> -			if (local_paca->in_mce == 1)
> -				slb_save_contents(local_paca->mce_faulty_slbs);
> -			flush_and_reload_slb();
> -			disposition = RTAS_DISP_FULLY_RECOVERED;
> -			break;
> -		default:
> -			break;
> -		}
> -	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
> -		/* Platform corrected itself but could be degraded */
> -		printk(KERN_ERR "MCE: limited recovery, system may "
> -		       "be degraded\n");
> -		disposition = RTAS_DISP_FULLY_RECOVERED;
> -	}
> -#endif
> +static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
> +{
> +	struct pseries_errorlog *pseries_log;
> +	struct pseries_mc_errorlog *mce_log = NULL;
> +	int disposition = rtas_error_disposition(errp);
> +	u8 error_type;
> +
> +	if (!rtas_error_extended(errp))
> +		goto out;
> +
> +	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
> +	if (!pseries_log)
> +		goto out;
> +
> +	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
> +	error_type = mce_log->error_type;
> +
> +	disposition = mce_handle_err_realmode(disposition, error_type);
>   
> -out:
>   	/*
>   	 * Enable translation as we will be accessing per-cpu variables
>   	 * in save_mce_event() which may fall outside RMO region, also
> @@ -724,10 +744,10 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>   	 * Note: All the realmode handling like flushing SLB entries for
>   	 *       SLB multihit is done by now.
>   	 */
> +out:
>   	mtmsr(mfmsr() | MSR_IR | MSR_DR);
> -	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
> -			&mce_err, regs->nip, eaddr, paddr);
> -
> +	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
> +					      disposition);
>   	return disposition;
>   }
>   

We need this fix as well to fix pseries mce handling, Any comments on this patch.

Thanks

Ganesh

