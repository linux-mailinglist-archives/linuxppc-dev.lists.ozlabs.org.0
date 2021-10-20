Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22973434A50
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 13:40:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZ7vz5LzQz3c7L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 22:40:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5EIhJrD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Q5EIhJrD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZ7vF3gjZz2xX1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 22:39:53 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KB2IV5009931; 
 Wed, 20 Oct 2021 07:39:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=78CZtA7DJdQ43AWjO1ZaxKgwY7Q4hbCToV2KM4D1BBc=;
 b=Q5EIhJrDx095fiaymSsE8mix8Bseu5owxC21Qw4q1wIAXodJi1XYW8TiYJgBcBDkMpqi
 13PcJT8IOu6G3/L6W5roW18bbUsSUc1Z6QMFFwbVb2pkU87XrI/ZWapcAWmz7w1BgURk
 leVwy8IMOcKCCAar3W2/UCqdD7smwAAJ28pYZAcifPPsXidKCJeCA6lsrEFnXrNg9xUy
 gPqAc3hLE/kgkcfiIKLtvaxkPqjlDZmDrlTOruA54mfk2Cs0Nlqrn1b3/bbUeOAbMs3A
 /aL5Pvip+QbU80655+Ni28sY584BkgT9YxTDftVULpEyPJTBx/cgzlLjmURHMBO7r8Pw YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btffvktab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 07:39:44 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19KBPhWI031782;
 Wed, 20 Oct 2021 07:39:43 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btffvkta3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 07:39:43 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KBY0XB002979;
 Wed, 20 Oct 2021 11:39:42 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3bqpcbk3gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 11:39:42 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KBdgn742008842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 11:39:42 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02686B2070;
 Wed, 20 Oct 2021 11:39:42 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1900B206B;
 Wed, 20 Oct 2021 11:39:41 +0000 (GMT)
Received: from localhost (unknown [9.211.47.38])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 11:39:41 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] PCI/hotplug: Remove unneeded of_node_put() in pnv_php
In-Reply-To: <20211020094604.2106-1-wanjiabing@vivo.com>
References: <20211020094604.2106-1-wanjiabing@vivo.com>
Date: Wed, 20 Oct 2021 06:39:41 -0500
Message-ID: <87tuhcx6v6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3m8auIF7k-yix6-D2F7RV_h5zyUfgNLu
X-Proofpoint-ORIG-GUID: jEAV2QbqvK3Pv4qQVHoe99gfkW1sGJfZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_04,2021-10-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011 spamscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200066
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Wan Jiabing <wanjiabing@vivo.com>,
 ajd@linux.ibm.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 kael_w@yeah.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wan Jiabing <wanjiabing@vivo.com> writes:
> Fix following coccicheck warning:
> ./drivers/pci/hotplug/pnv_php.c:161:2-13: ERROR: probable double put.
>
> Device node iterators put the previous value of the index variable, so
> an explicit put causes a double put.

I suppose Coccinelle doesn't take into account that this code is
detaching and freeing the nodes.


> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index f4c2e6e01be0..f3da4f95d73f 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -158,7 +158,6 @@ static void pnv_php_detach_device_nodes(struct device_node *parent)
>  	for_each_child_of_node(parent, dn) {
>  		pnv_php_detach_device_nodes(dn);
>  
> -		of_node_put(dn);
>  		of_detach_node(dn);
>  	}

The code might be improved by comments explaining how the bare
of_node_put() corresponds to a "get" somewhere else in the driver, and
how it doesn't render the ongoing traversal unsafe. It looks suspicious
on first review, but I believe it's intentional and probably correct as
written.
