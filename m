Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5564922B9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 10:29:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JdNlQ2sHCz3bVy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 20:29:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=op3p3zJG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=op3p3zJG; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JdNkb3WKsz3002
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 20:28:54 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20I8S1hW009560; 
 Tue, 18 Jan 2022 09:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gGrS+/ut0ayWML/4FUZsnIIN+V2um9QGs0TkSfH8/rI=;
 b=op3p3zJGled0KeNC5roA3y0wlwBQbPv13VjISxLUo37jnYAN5pEpK01qkM+OblMuQIkf
 cf7RaX8CNXtrswswbTwp1d2ZzXm/4qzpuJP+I67NXikMy4OBfYytVpDGRo37GegJ27Dc
 4Cjw4MV1etPrH8atFskkHXyUAJked4FV3Atp7xp+Kr4CsDBqY5LLTKzCiJIvnwH02tKT
 ibMuCt9pKHZAR46OLmrLv04gHt7FPo9Yu9qq6eHZHWI0iOW3iR6gTID6qT0279I5y9gG
 DtvgbUFunLqH/DRpoblulgZ8kKLlkQBASAYiK4rJD9PgPcfDzWdLdO4uWs3oRuBro9N/ 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnt2m1399-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 09:28:46 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20I921vL002311;
 Tue, 18 Jan 2022 09:28:46 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dnt2m1391-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 09:28:45 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20I9Ewa0001818;
 Tue, 18 Jan 2022 09:28:45 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 3dknw9n51e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 09:28:45 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20I9ShSr28967220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 09:28:43 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAAABB206A;
 Tue, 18 Jan 2022 09:28:42 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42123B206C;
 Tue, 18 Jan 2022 09:28:42 +0000 (GMT)
Received: from sig-9-77-152-98.ibm.com (unknown [9.77.152.98])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 09:28:42 +0000 (GMT)
Message-ID: <c3a4dc6cb728744386ed982340bc23398ffb1ed1.camel@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] powerpc/pseries/vas: Use migration_in_progress
 to disable DLPAR
From: Haren Myneni <haren@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Tue, 18 Jan 2022 01:28:40 -0800
In-Reply-To: <871r1aurk9.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
References: <af4574e7553a632884a2f00fcb96bd82fa063fe9.camel@linux.ibm.com>
 <92d87ead72556e946d7fa6775c509de8b6d11935.camel@linux.ibm.com>
 <871r1aurk9.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lKRejQwhfZ7y6ZncPUgysjdptSt3qv8t
X-Proofpoint-GUID: RHfwgsY03WmVIqRh1vahVYXD4jqm0pSp
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_02,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1015 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=961
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180055
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

On Fri, 2022-01-14 at 11:59 -0600, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> 
> > Before migration starts, all secondary CPUs will be offline which
> > can invoke VAS DLPAR event.
> 
> I don't understand this statement, so I can't evaluate the patch. The
> current LPM implementation does not offline any CPUs.

Thanks for your comment. My mistake..

VAS notifier with of_reconfig_notifier_register() is called during
migration for other events. VAS notifier has a bug (
https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-December/238333.html
) and will fix it:

if ((action == OF_RECONFIG_ATTACH_NODE) ||
        (action == OF_RECONFIG_DETACH_NODE))
        intserv = of_get_property(dn, "ibm,ppc-interrupt-server#s",
&len);

As the current LPM notifier does not freeze the system, thought of
ignoring DLPAR CPU hotplug event with this migration_in_progress flag. 

I will fix this as well and repost DLPAR NXGZIP series. 

Thanks
Haren



