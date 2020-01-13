Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA6F138C7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 08:47:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47x5Jf31TtzDqLs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 18:46:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47x5GJ2RVXzDqFJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 18:44:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47x5GH2kTXz8tG7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 18:44:55 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47x5GH2QTFz9sQp; Mon, 13 Jan 2020 18:44:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47x5GG5ndpz9sPn
 for <linuxppc-dev@ozlabs.org>; Mon, 13 Jan 2020 18:44:54 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00D7gEib137093
 for <linuxppc-dev@ozlabs.org>; Mon, 13 Jan 2020 02:44:52 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvgjterb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 13 Jan 2020 02:44:52 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <linuxram@us.ibm.com>;
 Mon, 13 Jan 2020 07:44:50 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Jan 2020 07:44:47 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00D7ijAO30539948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 07:44:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E65F0AE057;
 Mon, 13 Jan 2020 07:44:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF999AE055;
 Mon, 13 Jan 2020 07:44:43 +0000 (GMT)
Received: from oc0525413822.ibm.com (unknown [9.80.202.21])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 13 Jan 2020 07:44:43 +0000 (GMT)
Date: Sun, 12 Jan 2020 23:44:40 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [RESEND PATCH v2 1/3] powerpc/powernv: Interface to define
 support and preference for a SPR
References: <cover.1578886602.git.psampat@linux.ibm.com>
 <926baad3fd0bf0b01b0adf83c71f2f4f6e9cf1e7.1578886602.git.psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <926baad3fd0bf0b01b0adf83c71f2f4f6e9cf1e7.1578886602.git.psampat@linux.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 20011307-0008-0000-0000-00000348D974
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011307-0009-0000-0000-00004A6927A5
Message-Id: <20200113074440.GC5419@oc0525413822.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_01:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130065
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
 pratik.sampat@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 13, 2020 at 09:15:07AM +0530, Pratik Rajesh Sampat wrote:
> Define a bitmask interface to determine support for the Self Restore,
> Self Save or both.
> 
> Also define an interface to determine the preference of that SPR to
> be strictly saved or restored or encapsulated with an order of preference.
> 
> The preference bitmask is shown as below:
> ----------------------------
> |... | 2nd pref | 1st pref |
> ----------------------------
> MSB			  LSB
> 
> The preference from higher to lower is from LSB to MSB with a shift of 8
> bits.
> Example:
> Prefer self save first, if not available then prefer self
> restore
> The preference mask for this scenario will be seen as below.
> ((SELF_RESTORE_STRICT << PREFERENCE_SHIFT) | SELF_SAVE_STRICT)
> ---------------------------------
> |... | Self restore | Self save |
> ---------------------------------
> MSB			        LSB
> 
> Finally, declare a list of preferred SPRs which encapsulate the bitmaks
> for preferred and supported with defaults of both being set to support
> legacy firmware.
> 
> This commit also implements using the above interface and retains the
> legacy functionality of self restore.
> 
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/idle.c | 327 +++++++++++++++++++++-----
>  1 file changed, 271 insertions(+), 56 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 78599bca66c2..2f328403b0dc 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -32,9 +32,106 @@
>  #define P9_STOP_SPR_MSR 2000
>  #define P9_STOP_SPR_PSSCR      855
> 
> +/* Interface for the stop state supported and preference */
> +#define SELF_RESTORE_TYPE    0
> +#define SELF_SAVE_TYPE       1
> +
> +#define NR_PREFERENCES    2
> +#define PREFERENCE_SHIFT  4
> +#define PREFERENCE_MASK   0xf
> +
> +#define UNSUPPORTED         0x0
> +#define SELF_RESTORE_STRICT 0x1
> +#define SELF_SAVE_STRICT    0x2
> +
> +/*
> + * Bitmask defining the kind of preferences available.
> + * Note : The higher to lower preference is from LSB to MSB, with a shift of
> + * 4 bits.
> + * ----------------------------
> + * |    | 2nd pref | 1st pref |
> + * ----------------------------
> + * MSB			      LSB
> + */
> +/* Prefer Restore if available, otherwise unsupported */
> +#define PREFER_SELF_RESTORE_ONLY	SELF_RESTORE_STRICT
> +/* Prefer Save if available, otherwise unsupported */
> +#define PREFER_SELF_SAVE_ONLY		SELF_SAVE_STRICT
> +/* Prefer Restore when available, otherwise prefer Save */
> +#define PREFER_RESTORE_SAVE		((SELF_SAVE_STRICT << \
> +					  PREFERENCE_SHIFT)\
> +					  | SELF_RESTORE_STRICT)
> +/* Prefer Save when available, otherwise prefer Restore*/
> +#define PREFER_SAVE_RESTORE		((SELF_RESTORE_STRICT <<\
> +					  PREFERENCE_SHIFT)\
> +					  | SELF_SAVE_STRICT)
>  static u32 supported_cpuidle_states;
>  struct pnv_idle_states_t *pnv_idle_states;
>  int nr_pnv_idle_states;
> +/* Caching the lpcr & ptcr support to use later */
> +static bool is_lpcr_self_save;
> +static bool is_ptcr_self_save;
> +
> +struct preferred_sprs {
> +	u64 spr;
> +	u32 preferred_mode;
> +	u32 supported_mode;
> +};
> +
> +struct preferred_sprs preferred_sprs[] = {
> +	{
> +		.spr = SPRN_HSPRG0,
> +		.preferred_mode = PREFER_RESTORE_SAVE,
> +		.supported_mode = SELF_RESTORE_STRICT,
> +	},
> +	{
> +		.spr = SPRN_LPCR,
> +		.preferred_mode = PREFER_RESTORE_SAVE,
> +		.supported_mode = SELF_RESTORE_STRICT,
> +	},
> +	{
> +		.spr = SPRN_PTCR,
> +		.preferred_mode = PREFER_SAVE_RESTORE,
> +		.supported_mode = SELF_RESTORE_STRICT,
> +	},

This confuses me.  It says SAVE takes precedence over RESTORE.
and than it says it is strictly 'RESTORE' only.

Maybe you should not initialize the 'supported_mode' ?
or put a comment somewhere here, saying this value will be overwritten
during system initialization?


Otherwise the code looks correct.

Reviewed-by: Ram Pai <linuxram@us.ibm.com>
RP

