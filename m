Return-Path: <linuxppc-dev+bounces-8537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 256A5AB534F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 12:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxYNk6r88z2yMw;
	Tue, 13 May 2025 20:58:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747133894;
	cv=none; b=UkFUGrm77yAvZIP1h1ezV9wH7SgfbbLNIucIu6haNcOaSUrH/iPAn2XnGcITo4c6gcdXPIZ6mNSTQSeHNfxCX6gFJNruRxYMV1bQLlbLxTf2/dECbEem81E8lIf0tYuio/MZQe7BHb/rNSJlbyDrJCE+StwdKmiP2Qhz5ViNjRMu/0sipp1GRYOOzjyQScfFe7IT04N1ESWdAnnT04xKEViZK1IVIsAeVNK3gIpYuLiVWeISmECXcgR6tVkyxgrHbCM7WhOqv0MHSXPkWvuKlS2HGCO1GO0PKuZrpBrlAHhTFZCUJvuehWX4CYPZlbOs9+eBEgpT+e2ZaldOLFb1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747133894; c=relaxed/relaxed;
	bh=+wHXapLzifsdRBOpwP5KHLuo9BLVp6erNMcqcfeWd4Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CziCpjms9G5F5LPpTgY1elFi4iZ7CPE3bmukDKLhm00Dw4o/UBYex9aDcO4zaUOpaglXDuDpVRGLieAf/NWEEuCOfEIY5au8iqBSvF+gF8xxQTV3C3EVZjiYdiLW6UBl4Vnoudgab8G/lKKLF8GzXGISZmqYOntCYqTzSAIbjePY6qo+K2JGdVU0NAsMssgrmGqONjRnwDrfMiMq6NesQuS5nYjIi2ynbnWC9UG+Ah6FBni17rZKlVNg7R0vO9Q7k0uQaEBuAVlFPVtx2aoh9oI2fubhAoKOM0Zoya93wvd0yNRZoqTXjT3e/m7zKhd3MLImbPgLeCCs6hdQaQvDsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4W9IVu7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f4W9IVu7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxYNf2XDKz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 20:58:09 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D8pIEo012732;
	Tue, 13 May 2025 10:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=+wHXap
	LzifsdRBOpwP5KHLuo9BLVp6erNMcqcfeWd4Y=; b=f4W9IVu7qexw2FIer/0dTg
	X84aUIx+dHIvHsAPG70jfPnmO9L64KPKJC1VNuzdfPHDhFN4Xn7iwWTRUhyLDEgw
	3R2Ak9N20Smscz/DgBK+H78ZZ4R2fr7AzK3vKL7ZwX+hj0XuekZwjaLKjs1w0WDg
	sbsJ6b5aZsdeKyykhdegWuUeletOl4ZZ9CY5+iY9kVYooofuc09ufp1yJbUXz+V5
	Zu8ybvs0B3dZnDXwiM2GMt09akW0bfB1AhhZdGu8SB7G+dBhy1HVTAdEOSPZwr9h
	5bQYKy2z5XOKBdyLj9gB6P7A4qGTkGajlB90/Xw7fZP+7AT62VclJzEyQnraKY3g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46m2xh0kgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 10:58:06 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54DAo3BG029058;
	Tue, 13 May 2025 10:58:06 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46m2xh0kgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 10:58:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54DA5DKD025974;
	Tue, 13 May 2025 10:58:05 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jj4ntqaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 10:58:05 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54DAw3IY32244478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 10:58:03 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 832BD58064;
	Tue, 13 May 2025 10:58:03 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B35FF5803F;
	Tue, 13 May 2025 10:58:00 +0000 (GMT)
Received: from [9.111.68.46] (unknown [9.111.68.46])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 May 2025 10:58:00 +0000 (GMT)
Message-ID: <df79fe398bf832fc10c985e38654c6ffb47ad587.camel@linux.ibm.com>
Subject: Re: [PATCH] PCI/ERR: s390/pci: Use pci_uevent_ers() in PCI recovery
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Lukas Wunner <lukas@wunner.de>,
        Gerald Schaefer	
 <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger	 <borntraeger@linux.ibm.com>,
        Sven Schnelle
 <svens@linux.ibm.com>,
        Bjorn Helgaas	 <bhelgaas@google.com>,
        Peter
 Oberparleiter <oberpar@linux.ibm.com>,
        Matthew Rosato
 <mjrosato@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        "Oliver O'Halloran"	 <oohall@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Date: Tue, 13 May 2025 12:57:59 +0200
In-Reply-To: <20250424-add_err_uevents-v1-1-3384d6b779c6@linux.ibm.com>
References: <20250424-add_err_uevents-v1-1-3384d6b779c6@linux.ibm.com>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
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
X-Proofpoint-GUID: Ut2ivt-u5QJSSOIiaiagLtfdjydYMmhg
X-Proofpoint-ORIG-GUID: 8E81g7jIrpP88tlhpeoDOkb8rA8lS2Xv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEwMSBTYWx0ZWRfX5AH0d8fiklFk zM4wd6VO0fzHyiPB3QvQly2sj/NJaNY/TkT8fCjUXGpZ+eomb0CKJMfYizooYvFF33yrgsYpMGu bCoI4ibnuQx1GVDlhH+Rv8UG5fkBLWvpHxD+s6zB/I4HK8ty1qVgBUtwmb6i6ScHXyot61uOnPQ
 LXO3d8tTP7XeXEJXipltf5rWYa853j4q3Uz4nsjqJCu26Mw5Qk9AjMHJ2Altm1ZyEu3NuumHVcq BYTxzPhl0eOr4fI1T8dSEHcal8T/rQsaHLYwwKY++BxQwPa+nQIix4Uy5RuVgTt2RZOhy5NtBHJ 9E9WCCdfGwtB4HLt8bTv/TeXqwgBsbW5fUOb+cCADNbsva8cFTgtVpWh19C/bZZA+tcmYS5wp6R
 Q6nlHzhzZ+wyvxFUd++b9VrOJGvIs7Rjg2mLR6H1MFJIwvEjKIN9KjzbhgenNVRea55WxJWt
X-Authority-Analysis: v=2.4 cv=e+sGSbp/ c=1 sm=1 tr=0 ts=682325be cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=nbiFzm51mJyoxPHMFpAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130101
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-04-24 at 14:02 +0200, Niklas Schnelle wrote:
> Issue uevents during PCI recovery using pci_uevent_ers() as done by EEH
> and AER PCIe recovery routines.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 4cdf2f4e24ff ("s390/pci: implement minimal PCI error recovery")
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> Question: pci_uevent_ers() ignores PCI_ERS_RESULT_NEED_RESET which also
> means that unless we use PCI_ERS_RESULT_NONE instead of the return of
> error_detected() like EEH also does. there is no event for beginning
> recovery. This is also true for AER and seems odd, is this intentional?
>=20
> Npte: The fixes tag / Cc stable is maybe a bit borderline but I think
> having the events on EEH and AER but not on s390 warrants it. Thoughts?
> ---
>  arch/s390/pci/pci_event.c | 3 +++
>  drivers/pci/pci-driver.c  | 2 +-
>  include/linux/pci.h       | 2 +-
>  3 files changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/s390/pci/pci_event.c b/arch/s390/pci/pci_event.c
> index 7bd7721c1239a20e13cd3c618cce6679f36b0d06..37609bc2b514c00b5b91d6edd=
2ec366d59ae9f49 100644
> --- a/arch/s390/pci/pci_event.c
> +++ b/arch/s390/pci/pci_event.c
> @@ -91,6 +91,7 @@ static pci_ers_result_t zpci_event_notify_error_detecte=
d(struct pci_dev *pdev,
>  	pci_ers_result_t ers_res =3D PCI_ERS_RESULT_DISCONNECT;
> =20
>  	ers_res =3D driver->err_handler->error_detected(pdev,  pdev->error_stat=
e);
> +	pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);
>  	if (ers_result_indicates_abort(ers_res))
>  		pr_info("%s: Automatic recovery failed after initial reporting\n", pci=
_name(pdev));
>  	else if (ers_res =3D=3D PCI_ERS_RESULT_NEED_RESET)
> @@ -226,6 +227,7 @@ static pci_ers_result_t zpci_event_attempt_error_reco=
very(struct pci_dev *pdev)
>  		ers_res =3D zpci_event_do_reset(pdev, driver);
> =20
>  	if (ers_res !=3D PCI_ERS_RESULT_RECOVERED) {
> +		pci_uevent_ers(pdev, PCI_ERS_RESULT_DISCONNECT);
>  		pr_err("%s: Automatic recovery failed; operator intervention is requir=
ed\n",
>  		       pci_name(pdev));
>  		status_str =3D "failed (driver can't recover)";
> @@ -235,6 +237,7 @@ static pci_ers_result_t zpci_event_attempt_error_reco=
very(struct pci_dev *pdev)
>  	pr_info("%s: The device is ready to resume operations\n", pci_name(pdev=
));
>  	if (driver->err_handler->resume)
>  		driver->err_handler->resume(pdev);
> +	pci_uevent_ers(pdev, PCI_ERS_RESULT_RECOVERED);
>  out_unlock:
>  	pci_dev_unlock(pdev);
>  	zpci_report_status(zdev, "recovery", status_str);
> diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> index c8bd71a739f724e09b4dd773fb0cf74bddda1728..5cc031fae9a0210d66959ce60=
82539e52cdd81b4 100644
> --- a/drivers/pci/pci-driver.c
> +++ b/drivers/pci/pci-driver.c
> @@ -1584,7 +1584,7 @@ static int pci_uevent(const struct device *dev, str=
uct kobj_uevent_env *env)
>  	return 0;
>  }
> =20
> -#if defined(CONFIG_PCIEAER) || defined(CONFIG_EEH)
> +#if defined(CONFIG_PCIEAER) || defined(CONFIG_EEH) || defined(CONFIG_S39=
0)
>  /**
>   * pci_uevent_ers - emit a uevent during recovery path of PCI device
>   * @pdev: PCI device undergoing error recovery
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e96713054388bdc82f439e51023c1bf..71628a9c61bd7bc90fdbd9bc6=
ab68603ac8800dd 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2688,7 +2688,7 @@ static inline bool pci_is_thunderbolt_attached(stru=
ct pci_dev *pdev)
>  	return false;
>  }
> =20
> -#if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH)
> +#if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH) || defined(CONFIG=
_S390)
>  void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type)=
;
>  #endif
> =20
>=20
> ---
> base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
> change-id: 20250417-add_err_uevents-6f8d4d7ce09c
>=20
> Best regards,

Gentle ping.

