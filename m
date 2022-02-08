Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C604ADDDA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 17:01:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtSSH21ZHz3cDV
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 03:01:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NgE/PORV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NgE/PORV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtSRV6YgLz301M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 03:01:10 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 218F0O8T007609; 
 Tue, 8 Feb 2022 16:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=txziNNS2FxM4Us5pX3ZIHnDROGxgQbB/x5ihma9qjCs=;
 b=NgE/PORVkgaKDGnbUcMTElg0Vr4FJ8MrEZyskoHsd+14O2WAWB77qtMV5dtrm2Os9By9
 H7BHWhjIixNtSIvly5qZ2ROVovH/6c+ucbfJ00prSt+1IW7aHGkU0cwwIvP48ZcmqHx6
 tBunay9t1LctezdlvhUkNNWr2nCn0d91JKeOsbAvs79gnq/Xc2+bnT/QwKAUIQyGCsVH
 ifIW3visE6VrSJuoJLoqe6ZAwDMFlDFloxGpUmNDFcLaaYXH1vQHCP7vflNhAJr6mn3I
 T3sGnyoWQMb7DKbPlY+8qbq/6zOou36j/Y1/kZj5YcJRf3gM5oZo/zW28B3SK8RS2Xoc Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3ny8hq64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 16:01:05 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 218FSOwP003297;
 Tue, 8 Feb 2022 16:01:04 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3ny8hq4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 16:01:04 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 218FviCM031202;
 Tue, 8 Feb 2022 16:01:03 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3e1gvaexk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 16:01:03 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 218G10NB25428424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Feb 2022 16:01:00 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EC8A28067;
 Tue,  8 Feb 2022 16:01:00 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 740A42805E;
 Tue,  8 Feb 2022 16:00:58 +0000 (GMT)
Received: from sig-9-65-84-116.ibm.com (unknown [9.65.84.116])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  8 Feb 2022 16:00:58 +0000 (GMT)
Message-ID: <d4bbe77055e6d8cf79a83c7d9bf5e866f7e22939.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/pseries/vas: Define global hv_cop_caps
 struct
From: Haren Myneni <haren@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Tue, 08 Feb 2022 08:00:56 -0800
In-Reply-To: <87iltps6jx.fsf@linux.ibm.com>
References: <d977832373068e57a13c0e2e47afb2dd4e8d7c3d.camel@linux.ibm.com>
 <9ffeb5567b2836ee8326d530310e4eb4f6f9f1f2.camel@linux.ibm.com>
 <87iltps6jx.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SIBb6lg_TXv9oOMeC9BQUlIFV7XgZA0D
X-Proofpoint-ORIG-GUID: nBMGE_UVT3qaIfJ8dx5SGQkGHXMUEpBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_05,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080099
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-02-08 at 09:48 -0600, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > The coprocessor capabilities struct is used to get default and
> > QoS capabilities from the hypervisor during init, DLPAR event and
> > migration. So instead of allocating this struct for each event,
> > define global struct and reuse it, especially eliminate memory
> > allocation failure during migration.
> 
> Which allows the migration code to avoid adding an error path. I
> could
> go either way, but this approach seems fine to me assuming all users
> of
> the global object are guarded by an appropriate lock.
> 
> Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
> 

Thanks for your suggestion. I will change the commit message as you
suggested to make it clear. yes, this struct is accessed with mutex. 

Thanks
Haren

