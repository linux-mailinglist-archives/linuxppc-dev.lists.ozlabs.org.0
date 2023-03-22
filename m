Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5F6C572D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 21:14:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhfnS13W5z3f4N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 07:14:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mnkraf3S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mnkraf3S;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhfmS3fcqz3cHX;
	Thu, 23 Mar 2023 07:13:11 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MJJ8E1012032;
	Wed, 22 Mar 2023 20:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=FciNJ0nlhEuhbNNd4Y4FlzEWcMa/awWjFs5vbFg8cSE=;
 b=mnkraf3S8f+OMEax5E91eTE4yy1Ui6l5COXgyYd94WBXRtZMuhwCsWhSnmrfsxU0Gmob
 JQ561Y6FgvUguDfCgnTO0ZNpNIs5hvTuDq4d7o+BJniycwTBuuJep/sXZF0dlCmQAtmr
 nmBUXjC5VLDFHak5Qkt5YdtcGvF6uCajmAR0MfHNV4WK3tS8fhjxRH7FmxeY0DUp3WWL
 e2wKJn6cK35wJ+YR7Ttt5RxIQzg8wBn7WYKaeGztxmP20BACSjfGSTMgiLhLzouEIbrL
 CV6DpPLbIsD2dSh6qn7kwc1Yqu0x4JM6m875tKatDKWVaSIBgcFyriI4jJsShRX5njL2 3w== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg6w9tgb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 20:13:03 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MHmIXE019567;
	Wed, 22 Mar 2023 20:13:02 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3pd4x7250p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 20:13:02 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32MKD1TG47383274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Mar 2023 20:13:02 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A48C458065;
	Wed, 22 Mar 2023 20:13:01 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 906705804B;
	Wed, 22 Mar 2023 20:13:01 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Mar 2023 20:13:01 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id CA88C1756DF;
	Wed, 22 Mar 2023 15:13:00 -0500 (CDT)
Date: Wed, 22 Mar 2023 15:12:59 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [Skiboot] [PATCH V4 1/3] core/device: Add function to return
 child node using name at substring "@"
Message-ID: <ZBthS3BUmzKha8jZ@arbab-laptop.austin.ibm.com>
References: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230306033913.80524-1-atrajeev@linux.vnet.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eiZRsbRNugl8bLmMCC-I8UQ1ilXPTUbx
X-Proofpoint-ORIG-GUID: eiZRsbRNugl8bLmMCC-I8UQ1ilXPTUbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_17,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220141
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
Cc: maddy@linux.ibm.com, dan@danny.cz, kjain@linux.ibm.com, skiboot@lists.ozlabs.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Athira,

On Mon, Mar 06, 2023 at 09:09:11AM +0530, Athira Rajeev wrote:
>Add a function dt_find_by_name_substr() that returns the child node if
>it matches till first occurence at "@" of a given name, otherwise NULL.

Given this summary, I don't understand the following:

>+	assert(dt_find_by_name_substr(root, "node@1") == addr1);
>+	assert(dt_find_by_name_substr(root, "node0_1@2") == addr2);

Is this behavior required? I don't think it makes sense to call this 
function with a second argument containing '@', so I wouldn't expect it 
to match anything in these cases. The function seems to specifically 
enable it:

>+struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char *name)
>+{
[snip]
>+      node = strdup(name);
>+      if (!node)
>+              return NULL;
>+      node = strtok(node, "@");

Seems like you could get rid of this and just use name as-is.

I was curious about something else; say we have 'node@1' and 'node@2'.  
Is there an expectation of which it should match?

     addr1 = dt_new_addr(root, "node", 0x1);
     addr2 = dt_new_addr(root, "node", 0x2);
     assert(dt_find_by_name_substr(root, "node") == ???????);
                                                    ^^^^^^^

>+/* Find a child node by name and substring */
>+struct dt_node *dt_find_by_name_substr(struct dt_node *root, const char *name);

I think this name fit better in previous versions of the patch, but 
since you're specifically looking for '@' now, maybe call it something 
like dt_find_by_name_before_addr?

-- 
Reza Arbab
