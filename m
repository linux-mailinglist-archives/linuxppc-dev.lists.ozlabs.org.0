Return-Path: <linuxppc-dev+bounces-12239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46917B58114
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:44:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQTpy0chxz3dtJ;
	Tue, 16 Sep 2025 01:44:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757951049;
	cv=none; b=Hi/7dz6xoLn/3yPuQx5zVTuvHY3/TMkAwkpfdLpAdWMYW3kXd1DfZ+tySKeSlTZ/KDYpmK2Bdu57jv7waLy7Vj8vYWUm0XXTQK/y1PIJ+bsJuG+hjYaKlKoZ4PrLDY+KauJ06AQT7VYAseN27QW7nSqDnHyRmqu2emrj7mSdKOtdIgQKonlqMMPsiNEMkidlGRucBR9tjcW58eTQb1BvqgLePSLjQnhvoaLqrxclSyeU7oJhMLOzQwoxoyl2pymWsghcMSxbHrK6DoB9o5IXKurs3AaowpyRUtz9LwAt05q+c8M2uXiGRb5kIp5wDxkpQh8VY4/Lw5gFYFRys+papA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757951049; c=relaxed/relaxed;
	bh=TMUYpd2nzblfn8rITAb0oYwzeXWSSmD1Tlbr3rjq2Ng=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MeasoWej3sqfQhhVrOaND0NqzBBYh9UQo47jWX8QNXusx1O1bTE1uC/ARnGIdnLtpNTkg7F7cnZXxO8bIb8182ug79mTJJJoG4peIamlsZUQOA0LkZWysNwR82+jUWbbT4F+CZuzyvsZN3+BbCsWzV+BkfBVoXFkDL6MOYgYz91wRTrvDb6s0K9A4Um/e/TAjV6X7R8mfmUW20TMztELNGjdZaG+PBWChHmWaXkNQevvE+JykLtZ0zYFo7Q0+sl88oAzSLwxwILEgHN3L02ffhdq3yJ2A6NVy7sELE9tJDpNY1C2HuhwH/bJPx7z2V5hF03uPAuXM/UB+WBkv1Q8Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gFLcvl/q; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gFLcvl/q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQTpw6Yk3z3dTf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:44:08 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F9bo2j020054;
	Mon, 15 Sep 2025 15:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TMUYpd
	2nzblfn8rITAb0oYwzeXWSSmD1Tlbr3rjq2Ng=; b=gFLcvl/qGXlHsHh04l9FWm
	kvgS3Kqb7b2mV6hE6lFgTv/2ehO7ss+7WTWhefmMabffkoxhaFXn/BCG2CyHVZCR
	6QA/mpzAVTZ2v/VtjtTQxcVP8cFjQZmTLdx4G6zITwlnfGBlOSmMK7zEyC6p6ixp
	EWLYMBUn6cgewtS8LntAHdOceG88PQwOkmroOfJYAo0YCc1ItbOSzZXUFI/V9hQ7
	yOSd+tkv9W27yMQz20SjTkerxEhKKa5BrHxw6117BOJvRSaBjZc0P+JqagARU+ta
	fJCAJWNsZfm/ZkoMZiHm1jRNIMRYVLRXrPy52l8D3ibe0OOWPGoW4izOchCy/gYQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat1xr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:43:59 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FFcK5S017622;
	Mon, 15 Sep 2025 15:43:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 496gat1xr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:43:58 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58FE6UTx005935;
	Mon, 15 Sep 2025 15:43:57 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 495jxtycxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:43:57 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FFhuNQ24445446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 15:43:57 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93EF658057;
	Mon, 15 Sep 2025 15:43:56 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 830A358059;
	Mon, 15 Sep 2025 15:43:54 +0000 (GMT)
Received: from [9.111.35.47] (unknown [9.111.35.47])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 15:43:54 +0000 (GMT)
Message-ID: <3f57e4d2d317fecf50e1b87e5cce8a848e4098b3.camel@linux.ibm.com>
Subject: Re: [PATCH v2 3/4] Documentation: PCI: Amend error recovery doc
 with DPC/AER specifics
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
Date: Mon, 15 Sep 2025 17:43:53 +0200
In-Reply-To: <61d8eeadb20ee71c3a852f44c863bfe0209c454d.1757942121.git.lukas@wunner.de>
References: <cover.1757942121.git.lukas@wunner.de>
	 <61d8eeadb20ee71c3a852f44c863bfe0209c454d.1757942121.git.lukas@wunner.de>
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
X-Authority-Analysis: v=2.4 cv=BKWzrEQG c=1 sm=1 tr=0 ts=68c8343f cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=cm27Pg_UAAAA:8 a=VnNF1IyMAAAA:8
 a=KkUFHGsvljIy0fMCjwwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: rp1qdtcWLgxhpcmnYCfvK4Aa6T-YEw2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX1cqd++TuCWYQ
 m5+t1oC9I5qw6bQkKIAsXLRxFjzKapNV8Z9YDoBOqopHpwqAmdnSQVuBaRc1CigaofI6jd0fsdK
 WGbz/njz2gzUCVxj2nabXQ4Wm6BdTOPOMovrYq6MGNAaVqHcQifpbnCqwUEl/a200inie/eSlLH
 zajmQCYNuct1L2VmkixfnvpWRCdck5hG7PLSZ+adAahZsv3+bxcOkNZ1OLUTsLanoWqZ+o7KING
 DFQ1he7uYIWzlRFTWKBRiObwPM+Igvu1zibI+nq5xZq9V/1hh3gh5YgKYBMtYQ8xn7WcS8IlXOR
 bMz8wbyfqOw8Q293Cd0Dby04xedV0xqnoymqbv58ihTmwXTUcqPrwfqYOkh2umsuIUCgiSdADO0
 mFml4txG
X-Proofpoint-ORIG-GUID: l2W4QL8GpnSeA78T2gYWmupK6pSVcEXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-09-15 at 15:50 +0200, Lukas Wunner wrote:
> Amend the documentation on PCI error recovery with specifics about
> Downstream Port Containment and Advanced Error Reporting:
>=20
> * Explain that with DPC, devices are inaccessible upon an error (similar
>   to EEH on powerpc) and do not become accessible until the link is
>   re-enabled.
>=20
> * Explain that with AER, although devices may already be accessible in th=
e
>   ->error_detected() callback, accesses should be deferred to the
>   ->mmio_enabled() callback for compatibility with EEH on powerpc and wit=
h
>   s390.
>=20
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> ---
>  Documentation/PCI/pci-error-recovery.rst | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI=
/pci-error-recovery.rst
> index d5c661baa87f..9e1e2f2a13fa 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -122,6 +122,10 @@ A PCI bus error is detected by the PCI hardware.  On=
 powerpc, the slot
>  is isolated, in that all I/O is blocked: all reads return 0xffffffff,
>  all writes are ignored.
> =20
> +Similarly, on platforms supporting Downstream Port Containment
> +(PCIe r7.0 sec 6.2.11), the link to the sub-hierarchy with the
> +faulting device is disabled. Any device in the sub-hierarchy
> +becomes inaccessible.
> =20
>  STEP 1: Notification
>  --------------------
> @@ -204,6 +208,24 @@ link reset was performed by the HW. If the platform =
can't just re-enable IOs
>  without a slot reset or a link reset, it will not call this callback, an=
d
>  instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot R=
eset)
> =20
> +.. note::
> +
> +   On platforms supporting Advanced Error Reporting (PCIe r7.0 sec 6.2),
> +   the faulting device may already be accessible in STEP 1 (Notification=
).
> +   Drivers should nevertheless defer accesses to STEP 2 (MMIO Enabled)
> +   to be compatible with EEH on powerpc and with s390 (where devices are
> +   inaccessible until STEP 2).
> +
> +   On platforms supporting Downstream Port Containment, the link to the
> +   sub-hierarchy with the faulting device is re-enabled in STEP 3 (Link
> +   Reset). Hence devices in the sub-hierarchy are inaccessible until
> +   STEP 4 (Slot Reset).
> +
> +   For errors such as Surprise Down (PCIe r7.0 sec 6.2.7), the device
> +   may not even be accessible in STEP 4 (Slot Reset). Drivers can detect
> +   accessibility by checking whether reads from the device return all 1'=
s
> +   (PCI_POSSIBLE_ERROR()).
> +
>  .. note::
> =20
>     The following is proposed; no platform implements this yet:

Thanks for improving this. Makes sense to mention and spell this out
explicitly.

Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>

