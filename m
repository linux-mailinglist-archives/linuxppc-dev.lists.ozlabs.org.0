Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF7A24A515
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 19:38:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWw4N6gVBzDqxh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 03:38:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PrHM+Ywr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWw2T6x4YzDqkh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 03:37:05 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JHVgNF152394; Wed, 19 Aug 2020 13:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=1OL2Sq1s033Eq9EQRMR0nnFGLfi9yewbjzqMHkLu7Qg=;
 b=PrHM+YwrcB6wF1BOr1VDIM2GbnLaDpAzly7xj2jbvip7YnbhzD+eIZ8Kna6lqQaXbzb7
 jZLsqoDKFk3kL1L0ZSOW3UExuIPoQEwRo8eU2gG4Dyb6BxuDuKsvH49+AJNTYUbAbVqN
 p2nvOQILZ2Jdbd4yetSrLSXP/m4lUI2JC3nFIfUmwqkBp9qjhEKLz1KhphJ3x8EXX5hO
 fmlRA1dDQfsvDtbnqPc1eO5t7KIYzPYZPo+oQseWRY6Mf39Y7nfH/gvcPP21U+xDcIMi
 edym7tjnJzjIB9CJiJIaNRsW5/1XmVDaSPp9yARqLX8qsCj+wIP0A4/FF8r1i/yh8+mV YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 330yct2ujw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:37:02 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JHX3u2156144;
 Wed, 19 Aug 2020 13:37:01 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 330yct2ujn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:37:01 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JHZkrM003850;
 Wed, 19 Aug 2020 17:37:01 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3304ccs81d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 17:37:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JHb0T655443748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 17:37:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E230112062;
 Wed, 19 Aug 2020 17:37:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E0D2112064;
 Wed, 19 Aug 2020 17:37:00 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.75.122])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 17:37:00 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id DE97D2E2FE5; Wed, 19 Aug 2020 23:06:56 +0530 (IST)
Date: Wed, 19 Aug 2020 23:06:56 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/powernv/idle: add a basic stop 0-3 driver for
 POWER10
Message-ID: <20200819173656.GA21538@in.ibm.com>
References: <20200819094700.493399-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819094700.493399-1-npiggin@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_10:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190142
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Ryan P Grimm <rgrimm@us.ibm.com>, Michael Neuling <mikey@neuling.org>,
 linuxppc-dev@lists.ozlabs.org, Pratik Rajesh Sampat <psampat@linux.ibm.com>,
 "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 19, 2020 at 07:47:00PM +1000, Nicholas Piggin wrote:
> This driver does not restore stop > 3 state, so it limits itself
> to states which do not lose full state or TB.
> 
> The POWER10 SPRs are sufficiently different from P9 that it seems
> easier to split out the P10 code. The POWER10 deep sleep code
> (e.g., the BHRB restore) has been taken out, but it can be re-added
> when stop > 3 support is added.

MMCRA[BHRB] save/restore was in the shallow stop-state path. But we
can add it back later.

> 
> Cc: Ryan P Grimm <rgrimm@us.ibm.com>
> Cc: Michael Neuling <mikey@neuling.org>
> Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Cc: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Just a minor comment below. But otherwise the patch looks good to me.

[..snip..]

> @@ -1093,11 +1200,15 @@ int validate_psscr_val_mask(u64 *psscr_val, u64 *psscr_mask, u32 flags)
>   * @dt_idle_states: Number of idle state entries
>   * Returns 0 on success
>   */
> -static void __init pnv_power9_idle_init(void)
> +static void __init pnv_arch300_idle_init(void)
>  {
>  	u64 max_residency_ns = 0;
>  	int i;
> 
> +	/* stop is not really architected, we only have p9,p10 drivers */
> +	if (!pvr_version_is(PVR_POWER10) && !pvr_version_is(PVR_POWER9))
> +		return;
> +
>  	/*
>  	 * pnv_deepest_stop_{val,mask} should be set to values corresponding to
>  	 * the deepest stop state.
> @@ -1112,6 +1223,11 @@ static void __init pnv_power9_idle_init(void)
>  		struct pnv_idle_states_t *state = &pnv_idle_states[i];
>  		u64 psscr_rl = state->psscr_val & PSSCR_RL_MASK;
> 
> +		/* No deep loss driver implemented for POWER10 yet */
> +		if (pvr_version_is(PVR_POWER10) &&
> +				state->flags & (OPAL_PM_TIMEBASE_STOP|OPAL_PM_LOSE_FULL_CONTEXT))
> +			continue;
> +

Should we have a pr_info() informing the user the kernel is skipping
over these stop states ?

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

>  		if ((state->flags & OPAL_PM_TIMEBASE_STOP) &&
>  		     (pnv_first_tb_loss_level > psscr_rl))
>  			pnv_first_tb_loss_level = psscr_rl;

--
Thanks and Regards
gautham.
