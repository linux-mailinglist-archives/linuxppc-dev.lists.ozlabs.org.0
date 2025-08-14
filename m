Return-Path: <linuxppc-dev+bounces-10973-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326FB25E23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 09:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2cy53dShz30TG;
	Thu, 14 Aug 2025 17:56:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755158189;
	cv=none; b=bbtmQ0eOTTveAvDtAMsSwNtPtHmUBQ1Hz1v/ProuzppK5Teq2+KpgiymM7axpn9CsMfq2xPLa8nabW8zlYOwk7kZN5HR8DIELKpinntAINNbKJFS47KV5LGbhZSbclupUBFuJlRzjI8ympeIHbVUIXk9BYr0gym+MBjlUn6lLpr4QrUKEkihDhSOorZY0KAiridpA8UnLH5oXuenfEaCjgE2wG7WHFwFz4nFRX/2le2Z5n4dOMq23M6Y8O+c1tl+IeumabjW3yvBvtHZ0sq+I5l5zEZv58xdsLKoYev6pGeWEUVSNVl6TRbhCWCedHMAO/XzYlVzaEcyliBbW3RlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755158189; c=relaxed/relaxed;
	bh=6VlQ7yQ/ntyE8LoypGX6lnf9UKkcOkIank9t78ITRpE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E8mQAHItYdnbTFGLqfzjbsQ94C6CJvk7hWhZl1KDyrl6jUkUQ77c6Qj3mOfaGOmn+bj5/h+3mWmb0mZcXXcCqtqJuD7FwuEk6hpC4GMvrDnduP8Npe8pmmE/Px6C/kfqXCzZS9GKhhQp0wi230kQVPRlGfnXuPw6dXxTDyej8zkLPhNF3sJ3QTSgDbER+7kGIqYglW3959xj5hxa0DPIa6M10h91jUItPdpZz+fX09mpn3qeXlYLpMBmbK/unOTmWNmxYXvbcXoN6Alb8yd6MJp4VrZ9gNWhQ0FBd35CfnnCuPQRSQlNCudQSASP2vcEn8ZrKdwrGt6SBw37ttgxNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mI0qBzxi; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mI0qBzxi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2cy433Zsz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 17:56:28 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E73pSa015507;
	Thu, 14 Aug 2025 07:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6VlQ7y
	Q/ntyE8LoypGX6lnf9UKkcOkIank9t78ITRpE=; b=mI0qBzxi/PCUaBwoch40kw
	wj0vt8TuBMr4xvuFue3JAm9NOsTC6f+IrHzr3165XAxJX6TkzVxcbY06Z0thpL0r
	5Luw0mB3rKl6dD8bRqsO/eIslt562jdXon6HD10z+wdywo7S5XDMUGYPo61OUNJN
	4Lf+edAmdT8Iy1RtaEdEvl2gED6TFoGkR4bGljtzulvl472hk8Yq9CF/YbnZg2az
	M0/SVx2hd15tP5zbTmQl4hUDabkQDUH3cu98RxaHsAYr14d9ROzZMOqnrSmZMogc
	fQgwfuax2GTX7/8naCC9OQpTeFc90wxoqBLZGt9c/Pn9WBc7sCR6PiXYNggrsq2Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48gypeatbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:56:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57E7pc1H009355;
	Thu, 14 Aug 2025 07:56:14 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48gypeatb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:56:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57E6Q200017594;
	Thu, 14 Aug 2025 07:56:13 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ekc3tva5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 07:56:13 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57E7uCuX28377682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 07:56:13 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D052E58058;
	Thu, 14 Aug 2025 07:56:12 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D9405805C;
	Thu, 14 Aug 2025 07:56:10 +0000 (GMT)
Received: from [9.87.142.31] (unknown [9.87.142.31])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Aug 2025 07:56:10 +0000 (GMT)
Message-ID: <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
Subject: Re: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>,
        Aravind Iddamsetty	
 <aravind.iddamsetty@linux.intel.com>,
        "Sean C. Dardis"
 <sean.c.dardis@intel.com>,
        Terry Bowman <terry.bowman@amd.com>,
        Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linas Vepstas <linasvepstas@gmail.com>,
        Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>,
        Oliver OHalloran	 <oohall@gmail.com>,
        Manivannan
 Sadhasivam	 <manivannan.sadhasivam@oss.qualcomm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Date: Thu, 14 Aug 2025 09:56:09 +0200
In-Reply-To: <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
References: <cover.1755008151.git.lukas@wunner.de>
	 <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=eaU9f6EH c=1 sm=1 tr=0 ts=689d969f cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=qOJ_l1y5zSr8rzLU:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=pu2xdbaM_LAGYbC3j-cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: KhfcdkLCJ8KTlOV5TKINN-UFD5PXtsKP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE2NyBTYWx0ZWRfX5GQBPs9Vir6j
 bTDfm/VWeDYLFmfvI06OYrq34axmfR1aHZxMH4KcSZRH5FHDfpf68EMR7igheEXXt4lrxCFI8AJ
 3vmT2ALc1g/JBCCaFh/xnozaS2ZEE88YtmuHTevggiE5yk9ArEgrFczhMB/HxZ/aIuxMSjbFWVP
 uovsa2K/KHZ6ygaReEizcHVb1xGM1AtiyOD88Vh1FIIGcj1Agnnp3hKwQNPQF0iqrFstqR/YSEP
 KF49Q4Di82Ys3boVjUiR42kKdTrorQHFYR1MWuWj7QQQL08Oh+kZn6B7/kVoJCIwyUc8SAnFG0W
 0+7ATm+ZQnBE1NbQlwNInZVBa/hTlTrrT7QYUlBQ3Is9T1+/40u5ShRTIoO8WQPQXv10EtnnF5P
 GdI2lebk
X-Proofpoint-ORIG-GUID: h9H5WDMxPVjZNe8_LwXax2PQFe0_ui5c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508130167
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-08-13 at 07:11 +0200, Lukas Wunner wrote:
> When Advanced Error Reporting was introduced in September 2006 by commit
> 6c2b374d7485 ("PCI-Express AER implemetation: AER core and aerdriver"), i=
t
> sought to adhere to the recovery flow and callbacks specified in
> Documentation/PCI/pci-error-recovery.rst.
>=20
--- snip ---
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  drivers/pci/pcie/err.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5..e795e5ae6b03 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -217,15 +217,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *d=
ev,
>  	pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
> =20
>  	pci_dbg(bridge, "broadcast error_detected message\n");
> -	if (state =3D=3D pci_channel_io_frozen) {
> +	if (state =3D=3D pci_channel_io_frozen)
>  		pci_walk_bridge(bridge, report_frozen_detected, &status);
> -		if (reset_subordinates(bridge) !=3D PCI_ERS_RESULT_RECOVERED) {
> -			pci_warn(bridge, "subordinate device reset failed\n");
> -			goto failed;
> -		}
> -	} else {
> +	else
>  		pci_walk_bridge(bridge, report_normal_detected, &status);
> -	}
> =20
>  	if (status =3D=3D PCI_ERS_RESULT_CAN_RECOVER) {
>  		status =3D PCI_ERS_RESULT_RECOVERED;

On s390 PCI errors leave the device with MMIO blocked until either the
error state is cleared or we reset via the firmware interface. With
this change and the pci_channel_io_frozen case AER would now do the
report_mmio_enabled() before the reset with nothing happening between
report_frozen_detected() and report_mmio_enabled() is MMIO enabled at
this point? I think this callback really only makes sense if you have
an equivalent to s390's clearing of the error state that enables MMIO
but doesn't otherwise reset. Similarly EEH has eeh_pci_enable(pe,
EEH_OPT_THAW_MMIO).

> @@ -233,6 +228,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *de=
v,
>  		pci_walk_bridge(bridge, report_mmio_enabled, &status);
>  	}
> =20
> +	if (status =3D=3D PCI_ERS_RESULT_NEED_RESET ||
> +	    state =3D=3D pci_channel_io_frozen) {
> +		if (reset_subordinates(bridge) !=3D PCI_ERS_RESULT_RECOVERED) {
> +			pci_warn(bridge, "subordinate device reset failed\n");
> +			goto failed;
> +		}
> +	}
> +
>  	if (status =3D=3D PCI_ERS_RESULT_NEED_RESET) {
>  		/*
>  		 * TODO: Should call platform-specific

I wonder if it might make sense to merge the reset into the above
existing if. That would also work well with Sathyanarayanan's
suggestion to have state =3D=3D pci_channel_io_frozen upgrade to
PCI_ERS_RESULT_NEED_RESET. I'm a bit confused by that TODO comment and
anyway, it asks for a platform-specific reset to be added bu
reset_subordinate() already seems to allow platform specific behavior,
so maybe the moved reset should replace the TODO? Also I think for the
kind of broken case where the state is pci_channel_io_frozen but the
drivers just reports PCI_ERS_RESULT_CAN_RECOVER it looks like there
would be a reset but no calls to ->slot_reset().

Thanks,
Niklas

