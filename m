Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04538357525
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 21:49:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFw225WmSz3bvs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 05:48:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q0neIZmQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q0neIZmQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFw1c3rCjz2xZf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 05:48:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 137JXuub050484; Wed, 7 Apr 2021 15:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=agNhum4PDDzPx6WMBBM+gy6P2qjJ+8WKlt8/mCOSlQw=;
 b=q0neIZmQd8t9Czq6/qEplwHJkve94E1lLwnXowBl4eLqYiDTmUu0S7liID8qqR2S+EPw
 5cE+E8fsMPtobEjG7QUgTrRJbJGaB4wGey4vflSqFzz6g5pyZszWwFsEew2JA2YfBU8m
 1z5Sf0N8FrP/qJ9oysuA0HGk3R9DuwbSxWm/nV0xYXGwnhLD9ulyFoLjCjhFAd0ADdHi
 Gw6iVfAPcHTOJiSgyIQthY2pCXX+pgqQ7HAseWbAxFsWfV4FvXFKH/Dyolxlz7avUJBg
 iO0XSs8dFG60exarGM4cdP97oFIxBX9onQaR0tkFQ09stzqfTWLlZj9OgjiJam7JpGke 6g== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37rvn0umc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 15:48:30 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 137Jhp1w007590;
 Wed, 7 Apr 2021 19:48:29 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 37rvc41tdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Apr 2021 19:48:29 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 137JmSoj24642000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Apr 2021 19:48:28 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2154DBE053;
 Wed,  7 Apr 2021 19:48:28 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2B1ABE04F;
 Wed,  7 Apr 2021 19:48:27 +0000 (GMT)
Received: from localhost (unknown [9.211.35.170])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  7 Apr 2021 19:48:27 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v4] pseries: prevent free CPU ids to be reused on
 another node
In-Reply-To: <20210407153808.59993-1-ldufour@linux.ibm.com>
References: <20210407153808.59993-1-ldufour@linux.ibm.com>
Date: Wed, 07 Apr 2021 14:48:27 -0500
Message-ID: <875z0xlvuc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _DF6cQbtfRXmnkPQ9q6cHUT0abp3qKQj
X-Proofpoint-ORIG-GUID: _DF6cQbtfRXmnkPQ9q6cHUT0abp3qKQj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-07_10:2021-04-07,
 2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104070135
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
Cc: cheloha@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
>
> Changes since V3, addressing Nathan's comment:
>  - Rename the local variable named 'nid' into 'assigned_node'
> Changes since V2, addressing Nathan's comments:
>  - Remove the retry feature
>  - Reduce the number of local variables (removing 'i')
>  - Add comment about the cpu_add_remove_lock protecting the added CPU mask.
> Changes since V1 (no functional changes):
>  - update the test's output in the commit's description
>  - node_recorded_ids_map should be static
>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>

Thanks Laurent.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
