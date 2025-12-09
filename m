Return-Path: <linuxppc-dev+bounces-14696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE3CAEF9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 07:01:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQSsN5SVZz2xbQ;
	Tue, 09 Dec 2025 17:01:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765260088;
	cv=none; b=DkqFUIJbslxbP677YGMy9zDxy2bxwQIc/FahuKIYEHk7OKprVHeMVRpOov6/Upi/lGycXNmtD74HjgGlplTTxkd1JuNvh/K+VQV2jZueyMVURDhT+kJKWT+mHkxh/VwZ8i+CPzLOBmbZStcIYs3jHo5pyODQxcetSQuqswcn6Y2QuKqYoGpmflGteeNGsDEijX8t1xlTM4kLW6+MwDfo64VQHqaf6hpnl+GSUmfK/fjs/gAb50Vx6YfZnKxXntZ89aYwqF27x7hOgyxWRNvnDxq2VYXth97BxSYkXOGpqzbTy+macz16F/cc2v/B06XzGZ8t+BKqqWUXB38vMH6icw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765260088; c=relaxed/relaxed;
	bh=eRHBhwbSHbr0zejo6cFiDgXFt1XfBp+HFJIptP1cGXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayXA402idfxTLJ/IC+TLMJ8Kc6TS1lTMTia/d+tPO/jNAAyIIBtCsG95hJq5PN0+6tPIVMMB10zLWDhPuO3xEDBbLayRbhCLIbNezZNzAq0U4gWfzZU86p2sq3JkLsiXCvpHBrmp/1Qwht2vMpURO18/RTZ8ud/uFR7WLKgfEtkC0CAolzdADauBmVH60LCtYtOxIzajSdSwHJptJxcywcYrfsZxl9Zp6h+SSrcoIjoWf2G49lHlveB2S7RIACBbUpmI/lP1Q+pxHsua8nGgeb5r3nveL32vDSZHtp2DTNSdXCtXFLITpMyF4YAEibWlCpv75EbGP7b0/dC3n+3abA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UB4VVy4u; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UB4VVy4u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQSsM0szGz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Dec 2025 17:01:26 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B94qQN8024586;
	Tue, 9 Dec 2025 06:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eRHBhw
	bSHbr0zejo6cFiDgXFt1XfBp+HFJIptP1cGXA=; b=UB4VVy4uYkE7M0lKIWiFUQ
	db1Fn5P+VQjofQDDSzzJCJ9WEkFkEKntYysz+y3LHICapLIsHz6ldIrkoXayiEL3
	upema6NPE0qvaEQOMkwSX37ZY716m7uhLDdY91KTNYCR31kqPc+WS1NPCNayp+Cw
	iP/jIT+O75khWxbdj0WPBU0T8z3F+IzkmhBJNZcmlZluJg78GKpAkQT4I+lZ2b/v
	DqmL7OUVq3ryqR0ZVErtWGiovRBTeYJ4tPXvmVM3LWwAZ9OP3GiQR4yc0hPrU9Oy
	8b7VOcl8AZlvwhXCMRlOesYFzcX/r3+a/1tL1mEgS2hgFy1BQrvRjhzOZqjr6QfQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4av9wvk0mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 06:01:19 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B95wBkk007192;
	Tue, 9 Dec 2025 06:01:19 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4av9wvk0mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 06:01:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B94BuF6002031;
	Tue, 9 Dec 2025 06:01:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw11j966s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 06:01:18 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B961GPs61407690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Dec 2025 06:01:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AC022004D;
	Tue,  9 Dec 2025 06:01:16 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23D4020043;
	Tue,  9 Dec 2025 06:01:15 +0000 (GMT)
Received: from Gautams-MacBook-Pro.local (unknown [9.43.109.144])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  9 Dec 2025 06:01:14 +0000 (GMT)
Date: Tue, 9 Dec 2025 11:31:07 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Message-ID: <aTe7I_nVw8xp4az9@Gautams-MacBook-Pro.local>
References: <aTZnZHYdZMXI-FE8@Gautams-MacBook-Pro.local>
 <B654DA82-1EEF-4D2C-8003-BAF32C5DE2E2@xenosoft.de>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B654DA82-1EEF-4D2C-8003-BAF32C5DE2E2@xenosoft.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S4R_KWxOPldsEMmEtYcIremLDA2jxlxg
X-Proofpoint-ORIG-GUID: omqoqEugLSzIEHbw_8bybpWts3p1nJa7
X-Authority-Analysis: v=2.4 cv=AdS83nXG c=1 sm=1 tr=0 ts=6937bb2f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=3L7t2NrWp81voSTSJyUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAwMCBTYWx0ZWRfX5yyglWvc1B2W
 VggrO0bkjlCWbxlP6CSF2OCvXIoXcaeyOFr0QOEYmvSNyD3gcbFTCe8jWblWYZZgUhnltbtlveC
 swFXcxyoUiFtceoNPjxHx+UCMeeFQyTQ2IRGkwkh5gW+uVCGaHvDrrxQSKjWoAp2U6Ty6YeLFoP
 WExEHtPeC7BiVlZ2sg6uUqUvAc8Zyi/DFqi86lJhZpPe7r8Y1/ipvYaEoKs68855wvEt5cemCO9
 TDEW0dsHVDWKpiH9wt812Yff8LQhiYS85NP2PJWm83uJ4BBRHt2nJ21jc+Vdz0TP9o2I/3JWMqk
 4nkGf/Na2kWyg2ts3gz9DOGuAqmlez/GRzXJdNXPtHDtYjY3o0LNZaLBuKURNMZ3RWhf7vqLm50
 KANaBtDsOiL+rc4tOeGJ1R8g5KCNKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 08, 2025 at 07:06:14AM +0100, Christian Zigotzky wrote:
> 
> > On 08 December 2025 at 06:51 am, Gautam Menghani <gautam@linux.ibm.com> wrote:
> > 
> > ﻿Hi Christian,
> > 
> > Thanks for the report. Can you also please share the QEMU command line
> > you were using? That would be helpful.
> > 
> > Thanks,
> > Gautam
> 
> Hi Gautam,
> 
> Here is the command line:
> 
> qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive format=raw,file=void-live-powerpc-20230317.img,index=0,if=virtio -netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw root=/dev/vda" -device virtio-gpu-pci -device virtio-mouse-pci -device virtio-keyboard-pci -device pci-ohci,id=newusb -audiodev id=sndbe,driver=pa,server=/run/user/1000/pulse/native -device usb-audio,bus=newusb.0 -enable-kvm -smp 4 -fsdev local,security_model=passthrough,id=fsdev0,path=/home/amigaone/Music -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare -display gtk


Were you running a KVM guest? Did you see the problem with the latest
kernel installed in the guest?

> 
> Thanks,
> Christian

