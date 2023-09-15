Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D27A2104
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 16:31:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mDtjKdyw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnGpt61WCz3dGt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 00:31:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mDtjKdyw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnGp00tj7z2yG9;
	Sat, 16 Sep 2023 00:31:03 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38FEE4d0015166;
	Fri, 15 Sep 2023 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=74jqlnG/oQVq3t2H+ivDY7Ehsf2WUeFbctY2mCRB5ck=;
 b=mDtjKdywcp6+x1bM2h5IHpxlXAHlUztUonjypvEMeiw8wt59K49t5Vk19+jb1evstwri
 zHG5B7EjVq5jn0HAi4rPW4ZQHqGkjkYTz/J/SJSgOlLyBDkx1UoMhE4/yLSeqnitaChT
 oIIPStIWwxUC6bSl5ByiArYJEcmqtuafr2AolB9hAO+75Y5rIsbdmVmwLqnWMIQewdmv
 aiXV9tqTgEAVMczQA0lNEQQJqzQdO4vEkLdpJHfcGP1banCHMaGQtS26zjIBqugKejFw
 w4NQsGQhI3GdzrI0ieAgwJl2jM9xAcBBWphT5mXSa5wKsbc1+XQ08AOst+zcG5f84FDF og== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4qk02nhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 14:30:57 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38FEATuZ002755;
	Fri, 15 Sep 2023 14:30:56 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t14hmm97f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 14:30:56 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38FEUudH5636648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 Sep 2023 14:30:56 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0565558059;
	Fri, 15 Sep 2023 14:30:56 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E862958061;
	Fri, 15 Sep 2023 14:30:55 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 15 Sep 2023 14:30:55 +0000 (GMT)
Received: from arbab-laptop.austin.ibm.com (localhost [IPv6:::1])
	by arbab-laptop.localdomain (Postfix) with ESMTPS id 57FE7172BFF;
	Fri, 15 Sep 2023 09:30:55 -0500 (CDT)
Date: Fri, 15 Sep 2023 09:30:54 -0500
From: Reza Arbab <arbab@linux.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] core/device: Add function to return child node using
 name at substring "@"
Message-ID: <e51b68f9-1fee-4449-8b99-14bea76e9fc4@arbab-laptop>
References: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230914163206.97811-1-atrajeev@linux.vnet.ibm.com>
Organization: IBM Linux Technology Center
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ImCgFmSRAkG4dhDMLh-Bq06bespYqQtU
X-Proofpoint-ORIG-GUID: ImCgFmSRAkG4dhDMLh-Bq06bespYqQtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_11,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150126
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

On Thu, Sep 14, 2023 at 10:02:04PM +0530, Athira Rajeev wrote: 
>+struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, const char *name)
>+{
>+	struct dt_node *child, *match;
>+	char *child_node = NULL;
>+
>+	list_for_each(&root->children, child, list) {
>+		child_node = strdup(child->name);
>+		if (!child_node)
>+			goto err;
>+		child_node = strtok(child_node, "@");
>+		if (!strcmp(child_node, name)) {
>+			free(child_node);
>+			return child;
>+		}
>+
>+		match = dt_find_by_name_before_addr(child, name);
>+		if (match)
>+			return match;

When the function returns on this line, child_node is not freed.

>+	}
>+
>+	free(child_node);
>+err:
>+	return NULL;
>+}

I took at stab at moving free(child_node) inside the loop, and ended up 
with this:

struct dt_node *dt_find_by_name_before_addr(struct dt_node *root, const char *name)
{
	struct dt_node *child, *match = NULL;
	char *child_name = NULL;

	list_for_each(&root->children, child, list) {
		child_name = strdup(child->name);
		if (!child_name)
			return NULL;

		child_name = strtok(child_name, "@");
		if (!strcmp(child_name, name))
			match = child;
		else
			match = dt_find_by_name_before_addr(child, name);

		free(child_name);
		if (match)
			return match;
	}

	return NULL;
}

Does this seem okay to you? If you agree, no need to send another 
revision, I can just fixup during commit. Let me know.

>diff --git a/core/test/run-device.c b/core/test/run-device.c
>index 4a12382bb..fb7a7d2c0 100644
>--- a/core/test/run-device.c
>+++ b/core/test/run-device.c
>@@ -466,6 +466,20 @@ int main(void)
> 	new_prop_ph = dt_prop_get_u32(ut2, "something");
> 	assert(!(new_prop_ph == ev1_ph));
> 	dt_free(subtree);
>+
>+	/* Test dt_find_by_name_before_addr */
>+	root = dt_new_root("");
>+	addr1 = dt_new_addr(root, "node", 0x1);
>+	addr2 = dt_new_addr(root, "node0_1", 0x2);
>+	assert(dt_find_by_name(root, "node@1") == addr1);
>+	assert(dt_find_by_name(root, "node0_1@2") == addr2);
>+	assert(dt_find_by_name_before_addr(root, "node") == addr1);
>+	assert(dt_find_by_name_before_addr(root, "node0_") == NULL);

This line appears twice. As above, can fix during commit, so no need for 
a new patch.

>+	assert(dt_find_by_name_before_addr(root, "node0_1") == addr2);
>+	assert(dt_find_by_name_before_addr(root, "node0") == NULL);
>+	assert(dt_find_by_name_before_addr(root, "node0_") == NULL);
>+	dt_free(root);
>+
> 	return 0;
> }
>

-- 
Reza Arbab
