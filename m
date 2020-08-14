Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E41F244EDC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 21:32:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BStrM1hZdzDqnl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Aug 2020 05:32:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BStpS1C36zDqdL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 05:31:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kh9poQEn; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BStpR551zz9Cgv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 05:31:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BStpR4bmXz9sRK; Sat, 15 Aug 2020 05:31:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kh9poQEn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BStpP5lwDz9sTH;
 Sat, 15 Aug 2020 05:31:08 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07EJ2i3W083870; Fri, 14 Aug 2020 15:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=sq+DrViajElRFLX95rXpiEAeVto6iO9ei5mOipFAAUA=;
 b=kh9poQEnSHQICKQPbk4gt/NMmmsAqwJADhfCghFWQvVz+VyEDY6unc3ZXWKTyYSCrHYH
 uP9TcoVMtRYN5uzuhpeADm7pPY22vtlX0Ti0WklWEbfK20Tn9MOOkDZ9gXahzd+VZRDo
 AlKItFv21w5evq8IPhufsyMkHeirm/qcN+/XMCj5N/fwOFIpiH2RehED/nvS/2agEi5C
 VmytnQ5cX4qR4SwfG9n7c6z3QXh3pPqXX7ClHCLHRkaDoZOzz7TmL+uKi063725Z/NQE
 kjcNF3wpuzCbwAKlyKXbPwy4BLGi8su90IkxFBk07Z7+A0EzXTPbcz76Hwp1KR+bnvvU ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32wwxgmx53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 15:31:06 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07EJ34Hc085472;
 Fri, 14 Aug 2020 15:31:05 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32wwxgmx3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 15:31:05 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07EJPTPC032596;
 Fri, 14 Aug 2020 19:31:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 32skpa9pbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 19:31:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07EJV2ku54853988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 19:31:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08294124058;
 Fri, 14 Aug 2020 19:31:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5C38124052;
 Fri, 14 Aug 2020 19:31:01 +0000 (GMT)
Received: from localhost (unknown [9.65.223.18])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 19:31:01 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v3] pseries/drmem: don't cache node id in drmem_lmb struct
In-Reply-To: <87y2mhxhls.fsf@linux.ibm.com>
References: <20200811015115.63677-1-cheloha@linux.ibm.com>
 <87y2mhxhls.fsf@linux.ibm.com>
Date: Fri, 14 Aug 2020 14:31:01 -0500
Message-ID: <87v9hlxbwq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_12:2020-08-14,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=1 bulkscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=828 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140138
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, David Hildenbrand <david@redhat.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> I'm satisfied that this change does not reintroduce that problem. The
> removal path still derives the node without going to the device tree,
> but now performs a more efficient lookup.

Er, actually it's slightly less efficient in the remove path, as you
note in your commit message. This doesn't alter my opinion of the
change. The higher-level algorithmic inefficiencies (e.g. all the
for_each_drmem_lmb loops) in this code are more of a concern.
