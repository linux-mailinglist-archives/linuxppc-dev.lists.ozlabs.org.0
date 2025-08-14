Return-Path: <linuxppc-dev+bounces-11038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A4DB27033
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 22:31:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2xj94TCKz30Vn;
	Fri, 15 Aug 2025 06:31:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755203485;
	cv=none; b=XuZatGaK48D0GSXDZETKUYLJh6Y9uV7BjWfDfrvYV9fVtOBVHQcqIEtWcjZpcmjgVGbit8G4dDYwQQn63G+kurIY2WWY9s3DRXUXLkKtQfXkpY+pn0k27y/GHWPXGOIkQHI6RiSgzWGXKWdZ2GPYitkNcVZxsLasBiwoqgKj8Z7OhMqvWGR86mYBsOAWLgvJ/pg6BX7f0xwlAAn0Z7dGZVjgkyc/G70I0LdV899xR48LbIrtQ+fqZqx90oju9Eh/fAtcyA4XT6RhYVGrcY6+a0qoZ1xRrHDZIGGw2WxOHczlHCr5C9sN0rU7I7upaIpy4BCTONHDD7F4X+Oj7hwMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755203485; c=relaxed/relaxed;
	bh=0vERuFmkoOYNVlxlQGk3i0CnI64Xx1n+M6waoSmKsj8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S0sAb2Kz/tArMJBcsJUwdJRi1nzsFU7v9TcmURdeegNhXmnUDmQZX2IJHxKYxFZDOwwbdHHMOh/rI2bzeGnmpOUc7TxHZgdzaPjFRG/W163pAkrjH7+ytJH2iQtlWD7ljP62hOWozOIjNbw1JtvgO8uD38d52HNdKCjdofyHzADIsCLaT9uxbchUzbyjGtUl5yIT0kPdKalVZAmHhXZ6EfBGawTooUDYe3FgPTZ+wCMrTTq90z0Jh2EGp/XWOFH0NV9DhtSd93pkYVjFw7h5L6bWXsdhJfK/0v+zRLJM8U1ekB2bNmMVMl4XVBm6JBEeUxClEHgpD5hTGMEG5m9k/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XD3Q9jD7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XD3Q9jD7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2xj80yDLz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 06:31:23 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EEVQv9022462;
	Thu, 14 Aug 2025 20:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0vERuF
	mkoOYNVlxlQGk3i0CnI64Xx1n+M6waoSmKsj8=; b=XD3Q9jD7sh+cpVsAr8CSnT
	CWgD7LWYr0p3xx7/ggXaB72cwyL/EEFBTbU/QsGl7fXZXK3LLshk7NOsJagqLQVu
	48LDm6qfqPIWzLEEmlzJ6c45K/bYW/XyptPgn4nONBKeHEPfxBUT2HkdDiox8DBz
	P8zgG1owV2xAAw0VTNXV85gXRfDhVIewkXDxM9sOfOPeGCZmsUR9VpK9mLO1qhwv
	WyEPsuLHekjTJqzy57MvAFx4UpEn6tb1Gmvrhet25fmPWEfkt3FGZHPmyESPY/aL
	uOR8o2fwZTy0wQiuB9tlG1rafC6U1eBwlhp9W9vKZ2cJOjYoPAihQDqoGvsr01IQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14vajn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 20:31:16 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57EKVFap017938;
	Thu, 14 Aug 2025 20:31:15 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dx14vajb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 20:31:15 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57EI89j9020649;
	Thu, 14 Aug 2025 20:31:14 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48ehnq5vfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 20:31:14 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57EKVDcn10486364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 20:31:14 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB32758054;
	Thu, 14 Aug 2025 20:31:13 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D1C858045;
	Thu, 14 Aug 2025 20:31:11 +0000 (GMT)
Received: from [9.87.142.31] (unknown [9.87.142.31])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Aug 2025 20:31:11 +0000 (GMT)
Message-ID: <2db82c110045fa61bf498127bae13ce11cf77b08.camel@linux.ibm.com>
Subject: Re: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Riana Tauro <riana.tauro@intel.com>,
        Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
        "Sean C. Dardis"
 <sean.c.dardis@intel.com>,
        Terry Bowman	 <terry.bowman@amd.com>,
        Sathyanarayanan Kuppuswamy	 <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linas Vepstas	 <linasvepstas@gmail.com>,
        Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>,
        Oliver OHalloran <oohall@gmail.com>,
        Manivannan
 Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Date: Thu, 14 Aug 2025 22:31:10 +0200
In-Reply-To: <aJ2uE6v46Zib30Jh@wunner.de>
References: <cover.1755008151.git.lukas@wunner.de>
	 <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
	 <7c545fff40629b612267501c0c74bc40c3df29e2.camel@linux.ibm.com>
	 <aJ2uE6v46Zib30Jh@wunner.de>
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
X-Proofpoint-ORIG-GUID: HTmAmAw-eTh46ftBWoGyDnau1e_E1NCS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIyNCBTYWx0ZWRfX9RZiv7bwNyhW
 FHjjdbUSgJG1/vEAC5r5c1w2/pjt0Aujtlo+CcpRqHzD2LEP4x0nAnwDxyK+160FZIv8BIPh3Ju
 9gszXjcuGUsvO/6/3qn2RlkZkYVhuW+Lc2uOhsDJpEneuDSl4fuUnXp3BlvPtJqGuWU0nHggFP4
 HrT438trQMCZgPza12AMs9nSRceKEKlUXKesv6USb6o0WytqiBVKzuigM6sIUk3+wTTEq+LxSxp
 mZ6kAkHw1W339WxX343OFMqPyVQ9HgGed3t7mhaV3pnAEa6YIQRbnZhMFsWSASus8PNEjlMZpJR
 BZTBB+7ci4GitWFHV9rQVxplhOou/pkxl6kEbWSs0H9giJ0oo01uPnnEKGk9PDMsrtZfVf1hnRQ
 9IeDtjbv
X-Proofpoint-GUID: EwWvmPPSruesHt8yzzm2bwQPOCHnKEVp
X-Authority-Analysis: v=2.4 cv=fLg53Yae c=1 sm=1 tr=0 ts=689e4794 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=qOJ_l1y5zSr8rzLU:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=80MIjrmeD0fN6uWT1GsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120224
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-08-14 at 11:36 +0200, Lukas Wunner wrote:
> On Thu, Aug 14, 2025 at 09:56:09AM +0200, Niklas Schnelle wrote:
> > On Wed, 2025-08-13 at 07:11 +0200, Lukas Wunner wrote:
> >=20
--- snip ---
> > On s390 PCI errors leave the device with MMIO blocked until either the
> > error state is cleared or we reset via the firmware interface. With
> > this change and the pci_channel_io_frozen case AER would now do the
> > report_mmio_enabled() before the reset with nothing happening between
> > report_frozen_detected() and report_mmio_enabled() is MMIO enabled at
> > this point?
>=20
> Yes, MMIO access is controlled through the Memory Space Enable and
> Bus Master Enable bits in the Command Register (PCIe r7.0 sec 7.5.1.1.3).
> Drivers generally set those bits on probe and they're not automatically
> cleared by hardware upon an Uncorrectable Error.
>=20
> EEH and s390 blocking MMIO access likely serves the purpose of preventing
> corrupted data being propagated upstream.  AER doesn't support that
> (or at least doesn't mandate that -- certain implementations might
> be capable of blocking poisoned data).
>=20
> Thus with AER, MMIO access is usually possible already in ->error_detecte=
d().
> The only reason why drivers shouldn't be doing that and instead defer
> MMIO access to ->mmio_enabled() is to be compatible with EEH and s390.
>=20
> There are exceptions to this rule:  E.g. if the Uncorrectable Error
> was "Surprise Down", the link to the device is down and MMIO access
> isn't possible, neither in ->error_detected() nor ->mmio_enabled().
> Drivers should check whether an MMIO read results in an "all ones"
> response (PCI_POSSIBLE_ERROR()), which is usually what the host bridge
> fabricates upon a Completion Timeout caused by the link being down
> and the Endpoint being inaccessible.
>=20
> (There's a list of all the errors with default severity etc in PCIe r7.0
> sec 6.2.7.)
>=20
> I believe DPC was added to the PCIe Base Specification to prevent
> propagating corrupted data upstream, similarly to EEH and s390.
> DPC brings down the link immediately upon an Uncorrectable Error
> (the Linux driver confines this to Fatal Errors), but as a side
> effect this results in a Hot Reset being propagated down the
> hierarchy, making it impossible to access the device in the
> faulting state to retrieve debug information etc.  After the link
> has been brought up again, the device is in post-reset state.
> So DPC doesn't allow for reset-less recovery.
>=20
> With the ordering change introduced by this commit, ->mmio_enabled()
> will no longer be able to access MMIO space in the DPC case because
> the link hasn't been brought back up until ->slot_reset().  But as
> explained in the commit message, I only found two drivers affected
> by this.  One seems to be EEH-specific (drivers/scsi/ipr.c).
> And the other one (drivers/scsi/sym53c8xx_2/sym_glue.c) dumps debug
> registers in ->mmio_enabled() and I'm arguing that with this commit
> it's dumping "all ones", but right now it's dumping the post-reset
> state of the device, which isn't any more useful.
>=20
> > I think this callback really only makes sense if you have
> > an equivalent to s390's clearing of the error state that enables MMIO
> > but doesn't otherwise reset. Similarly EEH has eeh_pci_enable(pe,
> > EEH_OPT_THAW_MMIO).
>=20
> Right.
--- snip ---
> > I wonder if it might make sense to merge the reset into the above
> > existing if.
>=20
> There are drivers such as drivers/bus/mhi/host/pci_generic.c which
> return PCI_ERS_RESULT_RECOVERED from ->error_detected().  So they
> fall through directly to the ->resume() stage.  They're doing this
> even in the pci_channel_io_frozen case (i.e. for Fatal Errors).
>=20
> But for DPC we must call reset_subordinates() to bring the link back up.
> And for Fatal Errors, Documentation/PCI/pcieaer-howto.rst suggests that
> we must likewise call it because the link may be unreliable.
>=20
> Hence the if-condition must use a boolean OR, i.e.:
>=20
> 	if (status =3D=3D PCI_ERS_RESULT_NEED_RESET ||
> 	    state =3D=3D pci_channel_io_frozen) {
>=20
> ... whereas if I would move the invocation of reset_subordinates() inside
> the existing "if (status =3D=3D PCI_ERS_RESULT_NEED_RESET)", it would be
> equivalent to a boolean AND.
>=20
> I would have to amend drivers such as drivers/bus/mhi/host/pci_generic.c
> to work with the changed logic and I figured that it's simpler to only
> change pcie_do_recovery() rather than touching all affected drivers.
> I don't have any of that hardware and so it seems risky touching all
> those drivers.
>=20
> > I'm a bit confused by that TODO comment and
> > anyway, it asks for a platform-specific reset to be added bu
> > reset_subordinate() already seems to allow platform specific behavior,
> > so maybe the moved reset should replace the TODO?
>=20
> Manivannan has a patch pending which removes the TODO:
>=20
> https://lore.kernel.org/all/20250715-pci-port-reset-v6-1-6f9cce94e7bb@oss=
.qualcomm.com/
>=20
> > Also I think for the
> > kind of broken case where the state is pci_channel_io_frozen but the
> > drivers just reports PCI_ERS_RESULT_CAN_RECOVER it looks like there
> > would be a reset but no calls to ->slot_reset().
>=20
> Right, but that's what AER is currently doing and drivers such as
> drivers/bus/mhi/host/pci_generic.c are written to work with the
> existing flow.
>=20
> Thanks,
>=20
> Lukas

Thank you for the very clear and extremely detailed explanation both in
your replies and the commit messages, this is really helpful and I
learned a lot. I know it was a lot of work and I appreciate you taking
that time and effort especially when the code was already merged!

Warm regards,
Niklas Schnelle

