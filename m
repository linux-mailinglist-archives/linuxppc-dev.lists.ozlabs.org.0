Return-Path: <linuxppc-dev+bounces-12240-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF9DB58128
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 17:47:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQTtM4bghz3f12;
	Tue, 16 Sep 2025 01:47:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757951227;
	cv=none; b=RdLxl9c5Up4Q0QvK1roALQ+/iOAebOAybVmy/Y69IR55hgT9L2qoHVjOmt52jjcz/HRcrJ5An28zwhTJcV3OIogr1KMB+UkQKKpgRT7b4mjVFYMXb3+DVDNoEn13xSyNvT41PD6CAtM51SkmbQndhNcNUeQVlbUesA9VxrxzDSH0r9zDDuHiP1E/njfOWITcQnYTp8SEAA4CM8X3wa2nOw2RcQncmqEgy/MsjyFymoLzQRrz2vYaXkD1bkWJ4dv69FbpZgZNbYlBzyu/7SS/hv6ODlJQD6BMvS1FpEv2aFru8J6Rgb+NNWC4L6yoejCRu00uwvvmJFo4smI/kT1XcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757951227; c=relaxed/relaxed;
	bh=EClZ5jZsXIeH/TGEm1DVB6BJqaK85USt9OEE92mSRVw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=deyJJ1CGjpzZifGe9JxsVEDdvDpAWklQ7KEmN4PM8NfMEF3lqzbhXDEAEeNMTp3qYdukbgrnUI8FfEolKKgqC7pwAPpLH298PiGnm4kKk5+fQ7Hos3Ongq7pTwwA7XIhwOndLICItN7+mjQYpuJNwIje35tia2eOOZ1iVgbEi7W6CyRlbSH8OLRWyXH8ILAVBppJppRT9XjiEY5Q5lsbGKY8OyrI4whM1VTUyFauwfoTTzlDgT5qBS7oCzgvq1MGh50vZmSnOrIJt/A6NGwmDWOIjkvQmVfWsfxIlEGQlSny3+YYgOt89wnxKh1As/wVqigI9VHnFXHSUytg/Rf/dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q3lPTHyL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q3lPTHyL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQTtL4fvMz3dVJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:47:06 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FBedq4003338;
	Mon, 15 Sep 2025 15:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=EClZ5j
	ZsXIeH/TGEm1DVB6BJqaK85USt9OEE92mSRVw=; b=Q3lPTHyLWD+b6nFG3YMUka
	B1RVpV1iuI8q2Tu8wrKjwVpEkVAZ3HRr2IKulCohkWLdxVmSS2WhYZqBxm7o8a/g
	KRRUzNAPTg4lcasiUc+4944+uq70cSSaPVQaJL+dhsGBjDKpQlk/8jtko8slFwJL
	ppYSu7dDJ9MWdtVi8LCyREbgN/PuNdPbPpOgh4YhCPDtbRU4lILzxyK1wSYrOenB
	pBHnx2SqtduEQCBNA2OhqBfyQND6aX//bmyv6MGtRg6JWM5pmXEcrsOUfIKTiY56
	5X4Tl8HLzVPiktfiKF58tM3NA1t17CO6T0mthWlzNHbHZVoEIEmrRR8V2Q3UJBJA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x35wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:46:58 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58FFLrBt011041;
	Mon, 15 Sep 2025 15:46:57 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 494y1x35wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:46:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58FFeJgx018637;
	Mon, 15 Sep 2025 15:46:56 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 495n5m707q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Sep 2025 15:46:56 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58FFkuRf29622870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 15 Sep 2025 15:46:56 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8747F58052;
	Mon, 15 Sep 2025 15:46:56 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77CF458056;
	Mon, 15 Sep 2025 15:46:54 +0000 (GMT)
Received: from [9.111.35.47] (unknown [9.111.35.47])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 15 Sep 2025 15:46:54 +0000 (GMT)
Message-ID: <4fa71778403c8025a85f30dd8a7dcf5bc9a4eaf9.camel@linux.ibm.com>
Subject: Re: [PATCH v2 4/4] Documentation: PCI: Tidy error recovery doc's
 PCIe nomenclature
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
Date: Mon, 15 Sep 2025 17:46:53 +0200
In-Reply-To: <db56b7ef12043f709a04ce67c1d1e102ab5f4e19.1757942121.git.lukas@wunner.de>
References: <cover.1757942121.git.lukas@wunner.de>
	 <db56b7ef12043f709a04ce67c1d1e102ab5f4e19.1757942121.git.lukas@wunner.de>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMCBTYWx0ZWRfX14HVU/Ad9H+s
 dIMMkG8ig5O2lYnBuhe29UZ6F+0hs+ERgs4O5n2QAuFIsbuzoyCmXOjowH6kf89mU9CDjy27SF1
 4OJUqST7Hmh7pB6YD4SPRef98HzUoBj+faVEEWeKyKnyDhJTXoWLXBOE6yXM2kUKUwmKISxfv1X
 HJo9nIXgdheUKAz8gvh6+xfa/1Xhs8RKjKgvgWJkiolKHxxvK/GqdfNCGQ2b5OlGcaWGOSPM5nZ
 84dstqf+fCAku3f4XO/1MEKzL+P9fLE/WjLV9sHrB5bF3X/SfnJv4IISHzcw2hCq4Y8Zz9aWBf2
 XO6D1eJufvs2CV/4fDJtMFRGsJ8aA3xL0flXHDCHAhlzOpD5Dk52z37amULIDES2R63NGOrwFRM
 /9Ya7jUA
X-Proofpoint-ORIG-GUID: 5J-H0mxm43hN5dGBn6qJ-0K5DhG9kypG
X-Authority-Analysis: v=2.4 cv=euPfzppX c=1 sm=1 tr=0 ts=68c834f2 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=cm27Pg_UAAAA:8 a=VnNF1IyMAAAA:8
 a=XEWlu9VqNwFSst1M3Z8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5-0ZgXorGEHd5_Td74dNKWHL9i0MXvvs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 2025-09-15 at 15:50 +0200, Lukas Wunner wrote:
> Commit 11502feab423 ("Documentation: PCI: Tidy AER documentation")
> replaced the terms "PCI-E", "PCI-Express" and "PCI Express" with "PCIe"
> in the AER documentation.
>=20
> Do the same in the documentation on PCI error recovery.  While at it,
> add a missing period and a missing blank.
>=20
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> ---
>  Documentation/PCI/pci-error-recovery.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI=
/pci-error-recovery.rst
> index 9e1e2f2a13fa..5df481ac6193 100644
> --- a/Documentation/PCI/pci-error-recovery.rst
> +++ b/Documentation/PCI/pci-error-recovery.rst
> @@ -13,7 +13,7 @@ PCI Error Recovery
>  Many PCI bus controllers are able to detect a variety of hardware
>  PCI errors on the bus, such as parity errors on the data and address
>  buses, as well as SERR and PERR errors.  Some of the more advanced
> -chipsets are able to deal with these errors; these include PCI-E chipset=
s,
> +chipsets are able to deal with these errors; these include PCIe chipsets=
,
>  and the PCI-host bridges found on IBM Power4, Power5 and Power6-based
>  pSeries boxes. A typical action taken is to disconnect the affected devi=
ce,
>  halting all I/O to it.  The goal of a disconnection is to avoid system
> @@ -206,7 +206,7 @@ reset or some such, but not restart operations. This =
callback is made if
>  all drivers on a segment agree that they can try to recover and if no au=
tomatic
>  link reset was performed by the HW. If the platform can't just re-enable=
 IOs
>  without a slot reset or a link reset, it will not call this callback, an=
d
> -instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot R=
eset)
> +instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot R=
eset).
> =20
>  .. note::
> =20
> @@ -259,14 +259,14 @@ The driver should return one of the following resul=
t codes:
> =20
>  The next step taken depends on the results returned by the drivers.
>  If all drivers returned PCI_ERS_RESULT_RECOVERED, then the platform
> -proceeds to either STEP3 (Link Reset) or to STEP 5 (Resume Operations).
> +proceeds to either STEP 3 (Link Reset) or to STEP 5 (Resume Operations).
> =20
>  If any driver returned PCI_ERS_RESULT_NEED_RESET, then the platform
>  proceeds to STEP 4 (Slot Reset)
> =20
>  STEP 3: Link Reset
>  ------------------
> -The platform resets the link.  This is a PCI-Express specific step
> +The platform resets the link.  This is a PCIe specific step
>  and is done whenever a fatal error has been detected that can be
>  "solved" by resetting the link.
> =20
> @@ -288,13 +288,13 @@ that is equivalent to what it would be after a fres=
h system
>  power-on followed by power-on BIOS/system firmware initialization.
>  Soft reset is also known as hot-reset.
> =20
> -Powerpc fundamental reset is supported by PCI Express cards only
> +Powerpc fundamental reset is supported by PCIe cards only
>  and results in device's state machines, hardware logic, port states and
>  configuration registers to initialize to their default conditions.
> =20
>  For most PCI devices, a soft reset will be sufficient for recovery.
>  Optional fundamental reset is provided to support a limited number
> -of PCI Express devices for which a soft reset is not sufficient
> +of PCIe devices for which a soft reset is not sufficient
>  for recovery.
> =20
>  If the platform supports PCI hotplug, then the reset might be
> @@ -338,7 +338,7 @@ Result codes:
>  	- PCI_ERS_RESULT_DISCONNECT
>  	  Same as above.
> =20
> -Drivers for PCI Express cards that require a fundamental reset must
> +Drivers for PCIe cards that require a fundamental reset must
>  set the needs_freset bit in the pci_dev structure in their probe functio=
n.
>  For example, the QLogic qla2xxx driver sets the needs_freset bit for cer=
tain
>  PCI card types::

Thanks for the bringing this in sync.

Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>

