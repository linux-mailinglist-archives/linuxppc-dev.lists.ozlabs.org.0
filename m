Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EEB63849
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 16:58:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jln611YlzDqYM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 00:58:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jllJ0nvLzDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 00:56:42 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x69EpvWw018740
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 9 Jul 2019 10:56:39 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tmt6qrq42-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 10:56:39 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Tue, 9 Jul 2019 15:56:38 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 9 Jul 2019 15:56:35 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x69EuYDc45351318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Jul 2019 14:56:35 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1C53B2067;
 Tue,  9 Jul 2019 14:56:34 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC825B205F;
 Tue,  9 Jul 2019 14:56:34 +0000 (GMT)
Received: from localhost (unknown [9.80.239.26])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Jul 2019 14:56:34 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: ["RFC PATCH" 1/2] powerpc/mm: Fix node look up with numa=off boot
In-Reply-To: <877e8x3mb4.fsf@concordia.ellerman.id.au>
References: <20190629083629.29037-1-aneesh.kumar@linux.ibm.com>
 <1329fd62-c2ad-f2c9-d3df-731f543dd3ea@linux.ibm.com>
 <87imslso3u.fsf@linux.ibm.com>
 <0beef991-6e3a-9f88-3c83-f9ff97c5d454@linux.ibm.com>
 <878stgsa2r.fsf@linux.ibm.com> <877e8x3mb4.fsf@concordia.ellerman.id.au>
Date: Tue, 09 Jul 2019 09:56:34 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19070914-0064-0000-0000-000003F8DC3D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011401; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01229728; UDB=6.00647663; IPR=6.01010987; 
 MB=3.00027652; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-09 14:56:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070914-0065-0000-0000-00003E31CAC5
Message-Id: <875zobs1ct.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907090178
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>>> Just checking: do people still need numa=off? Seems like it's a
>>>> maintenance burden :-)
>>>> 
>>>
>>> That is used in kdump kernel.
>>
>> I see, thanks.
>
> That doesn't mean it's a good idea :)
>
> Does it actually reduce memory usage much? Last time I dug into the
> kdump kernel's usage of weird command line flags none of them really did
> anything useful.

I think it's intended to work around bugs in numa initialization, e.g.

https://www.suse.com/support/kb/doc/?id=7023399

Hopefully the original bug with numa/kdump interaction has been fixed?

