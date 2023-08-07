Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49F7718D4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 05:46:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nldCemDs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK2LT6SWVz30NP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 13:46:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nldCemDs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK2KR5qRLz2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 13:45:47 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3773cZmW024880;
	Mon, 7 Aug 2023 03:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=zJWV1tUUYUxh58Dzj5FLAOjvd2S6FI2n8lv8rQd/V2w=;
 b=nldCemDspzLqn4JYipWC8A3ATQlVS7IDBD42yD0L+qgZKrPAGVZr9M5JY+23Lq1QQTXW
 1BytjCSEhNOxdieiEndLKbm7gMNSnT5Tt5iAv1yDtkw55FjidI/4wyi1RUo8uDKkbnnq
 2+/cc/rQWSqTrEjIlfiWdOLcn8L9Q7hD2O1LN44ZmbbsGdYFCiF/smMCxEyIWFTe3nxU
 R1BRpkr9aRWSdmVK0+POLaPCRoPp2WX6fy2mfAmpbitK0IIYjF0xpP1ITDQPCFseTiL2
 AEQQfa6EmBkLLqUvV6E7fqCUuLXNJs/n/yrOGpVHazEZicG9d2otIAKLe0QkkSVDoVb6 qQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sarvuga1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 03:45:33 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3773Tbsj030364;
	Mon, 7 Aug 2023 03:45:32 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sa1rmsqtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 03:45:32 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3773jUJK19727034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Aug 2023 03:45:30 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7867C20049;
	Mon,  7 Aug 2023 03:45:30 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBFF120040;
	Mon,  7 Aug 2023 03:45:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Aug 2023 03:45:29 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 19066600E5;
	Mon,  7 Aug 2023 13:45:26 +1000 (AEST)
Message-ID: <875ef649a9f5ecd459b36e99ffad9efffd7befe0.camel@linux.ibm.com>
Subject: Re: [RFC PATCH] cxl: Use pci_find_vsec_capability() to simplify the
 code
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Xiongfeng Wang <wangxiongfeng2@huawei.com>, fbarrat@linux.ibm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org
Date: Mon, 07 Aug 2023 13:45:20 +1000
In-Reply-To: <20230804075630.186054-1-wangxiongfeng2@huawei.com>
References: <20230804075630.186054-1-wangxiongfeng2@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gaQG8OBxA-krJHGzM-Vzx6FGlOs9Oj4m
X-Proofpoint-GUID: gaQG8OBxA-krJHGzM-Vzx6FGlOs9Oj4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_01,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=843 bulkscore=0 clxscore=1011 spamscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070031
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
Cc: linuxppc-dev@lists.ozlabs.org, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-08-04 at 15:56 +0800, Xiongfeng Wang wrote:
> PCI core add pci_find_vsec_capability() to query VSEC. We can use
> that
> core API to simplify the code.
>=20
> The only logical change is that pci_find_vsec_capability check the
> Vendor ID before finding the VSEC.
>=20
> PCI spec rev 5.0 says in 7.9.5.2 Vendor-Specific Header:
> =C2=A0 VSEC ID - This field is a vendor-defined ID number that indicates
> the
> =C2=A0 nature and format of the VSEC structure
> =C2=A0 Software must qualify the Vendor ID before interpreting this field=
.
>=20
> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>

LGTM

The cxl driver doesn't currently bind to any devices that don't have an
IBM vendor ID, and it's very unlikely to in future. If that ever
changes, this will of course need to be updated accordingly.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0drivers/misc/cxl/pci.c | 12 ++----------
> =C2=A01 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
> index 0ff944860dda..f3108977755d 100644
> --- a/drivers/misc/cxl/pci.c
> +++ b/drivers/misc/cxl/pci.c
> @@ -150,16 +150,8 @@ static inline resource_size_t p2_size(struct
> pci_dev *dev)
> =C2=A0
> =C2=A0static int find_cxl_vsec(struct pci_dev *dev)
> =C2=A0{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int vsec =3D 0;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u16 val;
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0while ((vsec =3D pci_find_next=
_ext_capability(dev, vsec,
> PCI_EXT_CAP_ID_VNDR))) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pci_read_config_word(dev, vsec + 0x4, &val);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0if (val =3D=3D CXL_PCI_VSEC_ID)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return vs=
ec;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> -
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return pci_find_vsec_capabilit=
y(dev, PCI_VENDOR_ID_IBM,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0CXL_PCI_VSEC_ID);
> =C2=A0}
> =C2=A0
> =C2=A0static void dump_cxl_config_space(struct pci_dev *dev)

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
