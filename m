Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A735B776B45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 23:52:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N3VKM7an;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLkLb3Kcrz3cQP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 07:52:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N3VKM7an;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLkKW37SBz30fV;
	Thu, 10 Aug 2023 07:51:42 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 379LmhBs020797;
	Wed, 9 Aug 2023 21:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=v8ObKeMu6EIrluY4mx2uyQV8sWwbnu+LmlwZ3X+DkC8=;
 b=N3VKM7antrvpm3D6SeXcecFl4h+2MLddtWm3rVpQkkrIOwFPc2vcyXGIJysh1bRlz/Nl
 aH0zzQZA0ajpNxWtA4RnHnrTcYyZG3N57cw42pkz5Wmv8vAg6QCiKLNzA92Ohr1whhqs
 csny+uedBD7LtRAMgU5Z42+1W1Iz82z55/geGH0i8iWluL2UbBleY04HEFO5LF64jDe+
 kipI1yeCmrE0jzX8xYEemGXpZugn6tKR0w6EP7Fb72L0zjUeQAV3ImMK1ggrWe2RDN9v
 4bvQzN31p2MmpZQ5Rf+Us704RIk4VXxj8z7WvAcr/RAZoD5e3nQvcYzTWjY3vwIYsCjN 7g== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sck1xg1r1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 21:51:35 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 379Kr5wF007560;
	Wed, 9 Aug 2023 21:51:34 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sa14ymaym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 21:51:34 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 379LpXYv6423230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Aug 2023 21:51:34 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A765258056;
	Wed,  9 Aug 2023 21:51:33 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 993CA58062;
	Wed,  9 Aug 2023 21:51:33 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Aug 2023 21:51:33 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id 10B48B1075D;
	Wed,  9 Aug 2023 16:51:33 -0500 (CDT)
Date: Wed, 9 Aug 2023 16:51:31 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V5 1/3] core/device: Add function to return child node
 using name at substring "@"
Message-ID: <5e399ad8-f928-4992-9236-609b229798cc@arbab-laptop>
References: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230717032431.33778-1-atrajeev@linux.vnet.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JHRs9Wx1zC1HM6kaE_75yWHgmi38opCW
X-Proofpoint-ORIG-GUID: JHRs9Wx1zC1HM6kaE_75yWHgmi38opCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-09_19,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308090188
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
Cc: maddy@linux.ibm.com, dan@danny.cz, mahesh@linux.ibm.com, kjain@linux.ibm.com, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Athira,

I still have a couple of the same questions I asked in v4.

On Mon, Jul 17, 2023 at 08:54:29AM +0530, Athira Rajeev wrote:
>Add a function dt_find_by_name_before_addr() that returns the child node if
>it matches till first occurrence at "@" of a given name, otherwise NULL.

Given this summary, I don't userstand the following:

>+	assert(dt_find_by_name(root, "node@1") == addr1);
>+	assert(dt_find_by_name(root, "node0_1@2") == addr2);

Is this behavior required? I don't think it makes sense to call this 
function with a second argument containing '@', so I wouldn't expect it 
to match anything in these cases. The function seems to specifically 
enable it:

>+struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, const char *name)
>+{
[snip]
>+	node = strdup(name);
>+	if (!node)
>+		return NULL;
>+	node = strtok(node, "@");

Seems like you could get rid of this and just use name as-is.

I was curious about something else; say we have 'node@1' and 'node@2'.  
Is there an expectation of which it should match?

     addr1 = dt_new_addr(root, "node", 0x1);
     addr2 = dt_new_addr(root, "node", 0x2);
     assert(dt_find_by_name_substr(root, "node") == ???????);
                                                    ^^^^^^^

-- 
Reza Arbab
