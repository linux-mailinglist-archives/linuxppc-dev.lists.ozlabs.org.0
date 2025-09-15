Return-Path: <linuxppc-dev+bounces-12242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7675B5813E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:51:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQTzG4Kfjz3dxN;
	Tue, 16 Sep 2025 01:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757951482;
	cv=none; b=FVNXJMpu0WeEHuoJr30BO8QVSFUe1WR4hmOrYqdO2pKreTik5miE4PpM87gytLjyEOkZ6/nfghC/EpqexLAHbgCI6lTdJkCFTxo67W+LJuhxWRf9NPU6GwwPtSedZq0AzMxCCeo5U8vIrU45uRHWKoSfxK+gMR69avI2yBwEyTG4QpsJUJfGmf6eu0fxq/RT/8HbA9vDnJWU+OB9tjJU5wEnv+A7Axik/3Fr6iEeatZ2rjdGdmYYFyEK95KKGM+gwlMrIW9OO2TnV3YuRZ0ZPa+hMoSa7D6Gscpz+rRNLw7aN1vPrWplF0WqokdPuKh6gxpLUJhnAa56vgjDA/9XHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757951482; c=relaxed/relaxed;
	bh=//XPbr1iyIW7P1JztIXV9dCYCDNt0+AOQxJ/xCNlKnk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CL6tABdd92+m1j+QJBcny9U5sbWRNHCxrsrONIcoB9HUXOerHHRrzuVITfJ37nqfqAxNUOFRHdVvD3a7tj/EpRuvOJrGnW7dwIw15cifNIppy7WORtrzxF7Ow+dl9KhlfbTdsO17Q2qm7KFk+t0NW0Yde7TSGXIKBtW2uu2+/inqtNbU+dqk+8qXzDJHbgcF7XAbuBKFWIgJDrk+MBH/O8W7fDbPvAL3iZy+e7M6DKMXeHsRKzlhQyguLqTfg2s4B2ZWD7rq+dCU9nYKMqNQm1Ch354ILCra9hSodgsODKEg0aPwsAiLmbGaFL/yFP6OcPN2VrNWZODsdy17QX4tzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e3Nf+B8C; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e3Nf+B8C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQTzF67nyz3dLl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:51:21 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FDXhpp023043;
	Mon, 15 Sep 2025 15:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=//XPbr
	1iyIW7P1JztIXV9dCYCDNt0+AOQxJ/xCNlKnk=; b=e3Nf+B8C+vXGcgQjAeoPIA
	zSCgK4NzJVx7T3o0Z7yvrG09K6ojTwRgMARTb2VT9M4nyg41lo1cQ0Mu8+lkuCy7
	JjOfO8OY/nfndlkjgKy/Igr78trLSyRouNkNu7+v0ueegcMzXHxpYGg63tHE423+
	FVIzi2FZNni4c646Wx0l1D9Hjgv29uvuJB41o9dzNXCbPysy8sokmm87xRiRpmIx
	wj84oy/4dLgEXrJ5AOlmXWQ/C6QqB4hTalh/+cSJ1+Yvb+667fQ4QpZHmtoExSyx
	AS5kA6IWYMeMB7LuKIWLO2x0KhMrsIstW8vKMzL0TFnCLI/vDAkXdawlawi8xDMg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnkmk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:51:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FFbOEx015423;
	Mon, 15 Sep 2025 15:51:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496avnkmk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:51:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58FFZJbq022290;
	Mon, 15 Sep 2025 15:51:13 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 495kxpf7s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:51:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FFpCPg25821912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 15:51:12 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4119B58045;
	Mon, 15 Sep 2025 15:51:12 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B165D58050;
	Mon, 15 Sep 2025 15:51:09 +0000 (GMT)
Received: from [9.111.35.47] (unknown [9.111.35.47])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 15:51:09 +0000 (GMT)
Message-ID: <2e2c882be991caf440596ffafa106c3fb345adc3.camel@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] Documentation: PCI: Sync error recovery doc with
 code
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>,
        Jonathan Corbet
	 <corbet@lwn.net>
Cc: Terry Bowman <terry.bowman@amd.com>,
        Ilpo Jarvinen	
 <ilpo.jarvinen@linux.intel.com>,
        Sathyanarayanan Kuppuswamy	
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linas Vepstas	
 <linasvepstas@gmail.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        Brian Norris
 <briannorris@chromium.org>
Date: Mon, 15 Sep 2025 17:51:08 +0200
In-Reply-To: <ed3c3385499775fcc25f1ee66f395e212919f94a.1757942121.git.lukas@wunner.de>
References: <cover.1757942121.git.lukas@wunner.de>
	 <ed3c3385499775fcc25f1ee66f395e212919f94a.1757942121.git.lukas@wunner.de>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
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
X-Proofpoint-ORIG-GUID: X7OGfJO6VG6XgDgxA1jyPyd8bfi0X7eB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDAyOCBTYWx0ZWRfXyOFI7NjSzj2X
 S1I8OU1yLTPlda15++AEAnOYuJmDCZiGKgPL2j134ybcKSJld3LEEKm90+4GV79qUfe73E4rWw+
 hwbXArJSI6uQpqfIJ9tyKinSyeHyT1SzGF5UyxessNV3jB9xjJ+8wGytjf5N3z7KON8X19pIlaX
 TY/OJ7j69HJcNK+Y+8N8pue5JYOYV5DgCwSrv/ORK7LXpgaQivopEpUlesH8oLmOrCetorv2X/r
 vPLUuFyyDshd2EsjFNbjAJtwbw2Jy1jMLvygqSYQyqTaXsn09ulqIeUIVPIuKc8SRzuoTuiXaG0
 m6ZVpjGvpRo7u1BneH2qjSb2kbW/Uyz2ATemW9l57Bcgd3qa6+ORNWP3SPY/PFN8UIEt+HhJLJz
 tCkKukmj
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=68c835f3 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=cm27Pg_UAAAA:8 a=VnNF1IyMAAAA:8
 a=dyF35nN4NjREyvBytOEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: KSFqkJDjITN1UH-eF84phS3be7vfTh1n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-09-15 at 15:50 +0200, Lukas Wunner wrote:
> Amend the documentation on PCI error recovery to fix minor inaccuracies
> vis-=C3=A0-vis the actual code:
>=20
> * The documentation claims that a missing ->resume() or ->mmio_enabled()
>   callback always leads to recovery through reset.  But none of the
>   implementations do this (pcie_do_recovery(), eeh_handle_normal_event(),
>   zpci_event_do_error_state_clear()).
>=20
>   Drop the claim to align the documentation with the code.
>=20
> * The documentation does not list PCI_ERS_RESULT_RECOVERED as a valid
>   return value from ->error_detected().  But none of the implementations
>   forbid this and some drivers are returning it, e.g.:
>   drivers/bus/mhi/host/pci_generic.c
>   drivers/infiniband/hw/hfi1/pcie.c
>=20
>   Further down in the documentation it is implied that the return value i=
s
>   in fact allowed:
>   "The platform will call the resume() callback on all affected device
>   drivers if all drivers on the segment have returned
>   PCI_ERS_RESULT_RECOVERED from one of the 3 previous callbacks."
>=20
>   The "3 previous callbacks" being ->error_detected(), ->mmio_enabled()
>   and ->slot_reset().
>=20
>   Add it to the valid return values for consistency.
>=20
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> ---
>  Documentation/PCI/pci-error-recovery.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI=
/pci-error-recovery.rst
> index 42e1e78353f3..d5c661baa87f 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -108,8 +108,8 @@ A driver does not have to implement all of these call=
backs; however,
>  if it implements any, it must implement error_detected(). If a callback
>  is not implemented, the corresponding feature is considered unsupported.
>  For example, if mmio_enabled() and resume() aren't there, then it
> -is assumed that the driver is not doing any direct recovery and requires
> -a slot reset.  Typically a driver will want to know about
> +is assumed that the driver does not need these callbacks
> +for recovery.  Typically a driver will want to know about
>  a slot_reset().
> =20
>  The actual steps taken by a platform to recover from a PCI error
> @@ -141,6 +141,9 @@ shouldn't do any new IOs. Called in task context. Thi=
s is sort of a
>  All drivers participating in this system must implement this call.
>  The driver must return one of the following result codes:
> =20
> +  - PCI_ERS_RESULT_RECOVERED
> +      Driver returns this if it thinks the device is usable despite
> +      the error and does not need further intervention.
>    - PCI_ERS_RESULT_CAN_RECOVER
>        Driver returns this if it thinks it might be able to recover
>        the HW by just banging IOs or if it wants to be given

Thanks and good catch on these inaccuracies.

Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>

