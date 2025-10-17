Return-Path: <linuxppc-dev+bounces-12975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA657BE665B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 07:18:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cntPx4rPcz306S;
	Fri, 17 Oct 2025 16:18:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760678293;
	cv=none; b=J/58uKZt8qQzDWiCljvTa376+suwLz4Ne+g6QqAvzfqkSiSh5FNsKRSfIWkoM0heN+DoDoSNNtSsFh5Hvb/kQreJdxVdWMrpWfQtFnGAoz0+Q3sA3Zh1EFAm3Shqd4DLGLpxxWMom7kV3gab1bR7obAWRx4AwvHmiK3ZPd0PlrfkcfHuQtBjUxFkN+7F0V1ujsZo+rLUkLB9rBXNCn2rw6GdeeDdIz/pLNJhOyVmp22spMietgaPMmb8fW8DqUblG1pKM38giZwFTHemAGUdBspnQJv+plH5IDkXzHWsc4rWQ7Ch5gshDgN7/IEe5uGzmTOeS1Xvvta3vxBOIGP2QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760678293; c=relaxed/relaxed;
	bh=yRq4Fjs9RQqmCumBXOIWM/V9Rdd8tRYzHUqt4EgQG1g=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=MLnArKTo8iz0T1gXE8r7ypRQXdqQFiHhgDUB6AL1TsQ4FfhKe1CEC15O6qrOWdPox0PPPhYRQkMd/eviKSwDrpgcD24ZucJ0BJziZeEpEtRvkgacOcWgJsgbuXNMciNS9U9b7E9oeZ5purczs4DkP/A8gmBDJ9m5a4gVxEU6xv4j///Bd3GkdUn0kvAtQoac0GD/ybQI1TClpeQZYaSgh3NBMuBArW7kiwG7roI80zbpDO1tvpdXlGxeiEKZ0Y3Hk2cfO2QB5Ld5447DHG4YWl6rA2Zhqaoml50ctidH9yKax1NNzGF2GkWtm41CvomZ9btP8lX59H3PQz39JApRag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PEeymNue; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PEeymNue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cntPw4nFTz2yrt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 16:18:12 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H3me5T021054;
	Fri, 17 Oct 2025 05:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=yRq4Fjs9RQqmCumBXOIWM/V9Rdd8tR
	YzHUqt4EgQG1g=; b=PEeymNueSinjU7DQxwA1rVIebo7bhmjJmy9xinIYgvOK5N
	NwHKuBLojWwD725343ve3TctOfnb57DkzwmoRsQha2erTTiUPeANaqlcanIhILYx
	VAQNb8nEXdYDt+Ez7iJ/D6xLMijWFezv3N4gxc/qRAtmEmK0LjmMVl3t93dv7JGu
	Fk+7Zx90Hakp+y9OQDeN4p5WOhU/3BjOr2v5xBP0wudGob//GGr1NLXu0xaj935V
	2kwMdcQONdC5Btmy7X4jMLeE1QCMFNT92WsZaoGf3fGjrN9QOa9NYfDyuIsbCz8h
	wJVnmfTr2cd2w6Wd8l2Js39HBuEJlMqUmGw3QBKA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qew0dh7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:17:53 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59H5ETKP030991;
	Fri, 17 Oct 2025 05:17:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qew0dh78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:17:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59H1gYRO028047;
	Fri, 17 Oct 2025 05:17:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49tdg9gn88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 05:17:52 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59H5Hpx132571958
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Oct 2025 05:17:51 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAAB758054;
	Fri, 17 Oct 2025 05:17:50 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACBE45805A;
	Fri, 17 Oct 2025 05:17:44 +0000 (GMT)
Received: from [9.124.220.117] (unknown [9.124.220.117])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Oct 2025 05:17:44 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------lEjR0iPOz9KnyL9ZWgMzVvbr"
Message-ID: <cff01514-9074-4c97-bcf1-d4e3594e48b0@linux.ibm.com>
Date: Fri, 17 Oct 2025 10:47:43 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drivers/base/node: Fold unregister_node() into
 unregister_one_node()
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Christophe Leroy
 <christophe.leroy@csgroup.eu>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael@kernel.org, Danilo Krummrich <dakr@kernel.org>,
        Dave Jiang <dave.jiang@intel.com>
References: <20251015172759.69864-1-sj@kernel.org>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20251015172759.69864-1-sj@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xubv_IjbsENKRNmx41Q90HchWwlwgPIN
X-Authority-Analysis: v=2.4 cv=eJkeTXp1 c=1 sm=1 tr=0 ts=68f1d182 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=4P3WUyT6FmEQvZmdkCYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9QPfRxTwsjrChipofWYA:9
 a=1qUZTG5jgF9W_AF5:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfXxS5P6sLnVrC3
 o7MeNSwZX9B5YAtb8LTm1QV4ovlO6cC8EqwNxPt+FYgSs5TPohEMr4E3GKVTqz/x8dZt9SjckeW
 aDS9TfPIpPnlODRhqtiDyAU83W8TtYz61wb4EluTmsaIVbUFYh7PRaqKnRzPPJL2cHVbFNLauYd
 +EMuSLS3z0wJVRhL7M83cglJJsMvvI2tQnUtdIuqBgXVmqyWNyJdbZo8yxXWu5qmuYgrA9i6qaY
 JM3iGxioMr+qzNoFhc7NWhVZdCWuN9NZ/Y4cRtd5xr7gF7ku4zShx2Ub7lOCcMTTj+JjBqeUQJJ
 hjqeMfnVAz3pH9ZAESW9O/sKKc9jRoPOUE3PhGxEz9xLeaF0hKLMIBo1RA0sgA6wQyMTuUyiQyr
 fn5ovtZM3HeHqQN9kDujHTHNLDB+2g==
X-Proofpoint-GUID: hgfPyIsn-v6oRJooxxEavvKmFDBTqY1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110014
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------lEjR0iPOz9KnyL9ZWgMzVvbr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/15/25 10:57 PM, SeongJae Park wrote:
> On Tue, 14 Oct 2025 21:09:17 +0530 Donet Tom<donettom@linux.ibm.com> wrote:
>
>> The function unregister_node() is only called from unregister_one_node().
>> This patch folds unregister_node() into its only caller and renames
>> unregister_one_node() to unregister_node().
>>
>> This reduces unnecessary indirection and simplifies the code structure.
>> No functional changes are introduced.
>>
>> Acked-by: David Hildenbrand<david@redhat.com>
>> Acked-by: Mike Rapoport (Microsoft)<rppt@kernel.org>
>> Signed-off-by: Donet Tom<donettom@linux.ibm.com>
> Acked-by: SeongJae Park<sj@kernel.org>
>
>> ---
>>   drivers/base/node.c  | 38 +++++++++++++++++---------------------
>>   include/linux/node.h |  6 ++----
>>   mm/memory_hotplug.c  |  4 ++--
>>   3 files changed, 21 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>> index 4bcaa8006cd6..758b777dec1f 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -676,23 +676,6 @@ static void node_device_release(struct device *dev)
>>   	kfree(to_node(dev));
>>   }
>>   
>> -/**
>> - * unregister_node - unregister a node device
>> - * @node: node going away
>> - *
>> - * Unregisters a node device @node.  All the devices on the node must be
>> - * unregistered before calling this function.
>> - */
>> -void unregister_node(struct node *node)
>> -{
>> -	hugetlb_unregister_node(node);
>> -	compaction_unregister_node(node);
>> -	reclaim_unregister_node(node);
>> -	node_remove_accesses(node);
>> -	node_remove_caches(node);
>> -	device_unregister(&node->dev);
>> -}
>> -
>>   struct node *node_devices[MAX_NUMNODES];
>>   
>>   /*
>> @@ -924,13 +907,26 @@ int register_node(int nid)
>>   
>>   	return error;
>>   }
>> -
>> -void unregister_one_node(int nid)
>> +/**
>> + * unregister_node - unregister a node device
>> + * @nid: nid of the node going away
>> + *
>> + * Unregisters the node device at node id  @nid.  All the devices on the
> Nit.  Why two spaces before "@nid"?

Thank you for pointing this out.

Andrew could you please help apply the below fixlet on top of this patch?

 From 0d0345847ad33607c7ebae3798ef37ff16a20fd0 Mon Sep 17 00:00:00 2001
From: Donet Tom<donettom@linux.ibm.com>                                        
Date: Fri, 17 Oct 2025 10:27:54 +0530
Subject: [PATCH] [fixlet] drivers/base/node: Remove extra space in description
                                                                                 
This patch removes an extra space before @nid and "All".
                                                                                 
Signed-off-by: Donet Tom<donettom@linux.ibm.com>                               
---
  drivers/base/node.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
                                                                                 
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 63b223a3b38e..00cf4532f121 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -911,7 +911,7 @@ int register_node(int nid)
   * unregister_node - unregister a node device
   * @nid: nid of the node going away
   *
- * Unregisters the node device at node id  @nid.  All the devices on the
+ * Unregisters the node device at node id @nid. All the devices on the
   * node must be unregistered before calling this function.
   */
  void unregister_node(int nid)
--
2.51.0


>
> [...]
>
>
> Thanks,
> SJ
--------------lEjR0iPOz9KnyL9ZWgMzVvbr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/15/25 10:57 PM, SeongJae Park
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251015172759.69864-1-sj@kernel.org">
      <pre wrap="" class="moz-quote-pre">On Tue, 14 Oct 2025 21:09:17 +0530 Donet Tom <a class="moz-txt-link-rfc2396E" href="mailto:donettom@linux.ibm.com">&lt;donettom@linux.ibm.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The function unregister_node() is only called from unregister_one_node().
This patch folds unregister_node() into its only caller and renames
unregister_one_node() to unregister_node().

This reduces unnecessary indirection and simplifies the code structure.
No functional changes are introduced.

Acked-by: David Hildenbrand <a class="moz-txt-link-rfc2396E" href="mailto:david@redhat.com">&lt;david@redhat.com&gt;</a>
Acked-by: Mike Rapoport (Microsoft) <a class="moz-txt-link-rfc2396E" href="mailto:rppt@kernel.org">&lt;rppt@kernel.org&gt;</a>
Signed-off-by: Donet Tom <a class="moz-txt-link-rfc2396E" href="mailto:donettom@linux.ibm.com">&lt;donettom@linux.ibm.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Acked-by: SeongJae Park <a class="moz-txt-link-rfc2396E" href="mailto:sj@kernel.org">&lt;sj@kernel.org&gt;</a>

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 drivers/base/node.c  | 38 +++++++++++++++++---------------------
 include/linux/node.h |  6 ++----
 mm/memory_hotplug.c  |  4 ++--
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index 4bcaa8006cd6..758b777dec1f 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -676,23 +676,6 @@ static void node_device_release(struct device *dev)
 	kfree(to_node(dev));
 }
 
-/**
- * unregister_node - unregister a node device
- * @node: node going away
- *
- * Unregisters a node device @node.  All the devices on the node must be
- * unregistered before calling this function.
- */
-void unregister_node(struct node *node)
-{
-	hugetlb_unregister_node(node);
-	compaction_unregister_node(node);
-	reclaim_unregister_node(node);
-	node_remove_accesses(node);
-	node_remove_caches(node);
-	device_unregister(&amp;node-&gt;dev);
-}
-
 struct node *node_devices[MAX_NUMNODES];
 
 /*
@@ -924,13 +907,26 @@ int register_node(int nid)
 
 	return error;
 }
-
-void unregister_one_node(int nid)
+/**
+ * unregister_node - unregister a node device
+ * @nid: nid of the node going away
+ *
+ * Unregisters the node device at node id  @nid.  All the devices on the
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit.  Why two spaces before "@nid"?</pre>
    </blockquote>
    <pre>Thank you for pointing this out.

Andrew could you please help apply the below fixlet on top of this patch?</pre>
    <pre>From 0d0345847ad33607c7ebae3798ef37ff16a20fd0 Mon Sep 17 00:00:00 2001          
From: Donet Tom <a class="moz-txt-link-rfc2396E" href="mailto:donettom@linux.ibm.com">&lt;donettom@linux.ibm.com&gt;</a>                                        
Date: Fri, 17 Oct 2025 10:27:54 +0530                                           
Subject: [PATCH] [fixlet] drivers/base/node: Remove extra space in description  
                                                                                
This patch removes an extra space before @nid and "All".                        
                                                                                
Signed-off-by: Donet Tom <a class="moz-txt-link-rfc2396E" href="mailto:donettom@linux.ibm.com">&lt;donettom@linux.ibm.com&gt;</a>                               
---                                                                             
 drivers/base/node.c | 2 +-                                                     
 1 file changed, 1 insertion(+), 1 deletion(-)                                  
                                                                                
diff --git a/drivers/base/node.c b/drivers/base/node.c                          
index 63b223a3b38e..00cf4532f121 100644                                         
--- a/drivers/base/node.c                                                       
+++ b/drivers/base/node.c                                                       
@@ -911,7 +911,7 @@ int register_node(int nid)                                  
  * unregister_node - unregister a node device                                  
  * @nid: nid of the node going away                                            
  *                                                                             
- * Unregisters the node device at node id  @nid.  All the devices on the          
+ * Unregisters the node device at node id @nid. All the devices on the         
  * node must be unregistered before calling this function.                     
  */                                                                            
 void unregister_node(int nid)                                                  
--                                                                              
2.51.0        </pre>
    <p></p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20251015172759.69864-1-sj@kernel.org">
      <pre wrap="" class="moz-quote-pre">

[...]


Thanks,
SJ
</pre>
    </blockquote>
  </body>
</html>

--------------lEjR0iPOz9KnyL9ZWgMzVvbr--


