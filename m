Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9018CA59
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 10:27:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kJMz6CmpzDrTC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 20:27:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kJKC4FY3zDrRh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 20:25:18 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02K942Qg113774; Fri, 20 Mar 2020 05:25:12 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu7aebenr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Mar 2020 05:25:12 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02K9NS4C017132;
 Fri, 20 Mar 2020 09:25:12 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 2yrpw6y6jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Mar 2020 09:25:11 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02K9PA1A29884688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 09:25:11 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4CF5BE059;
 Fri, 20 Mar 2020 09:25:10 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 813CBBE05D;
 Fri, 20 Mar 2020 09:25:09 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.72.106])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 09:25:09 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2] libnvdimm: Update persistence domain value for
 of_pmem and papr_scm device
In-Reply-To: <CAPcyv4iFP6_jkocoyv-6zd0Y8FEYFA3Pk6brH5+_XQ9+U896wQ@mail.gmail.com>
References: <20200205052056.74604-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4hBAk-dwO4=AT7cQm5YUwCBg0AECsZsiCjRJ_ZGWvWUAw@mail.gmail.com>
 <87y2ta8qy7.fsf@linux.ibm.com>
 <CAPcyv4hNV88FJybgoRyM=JuKgrwYaf+CLWfFWt5X3yFMrecU=Q@mail.gmail.com>
 <25eabdd9-410f-e4c3-6b0e-41a5e6daba10@linux.ibm.com>
 <CAPcyv4iFP6_jkocoyv-6zd0Y8FEYFA3Pk6brH5+_XQ9+U896wQ@mail.gmail.com>
Date: Fri, 20 Mar 2020 14:55:07 +0530
Message-ID: <87k13fnzt8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_01:2020-03-19,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003200037
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hi Dan,


Dan Williams <dan.j.williams@intel.com> writes:

...


>
>>
>> Or are you suggesting that application should not infer any of those
>> details looking at persistence_domain value? If so what is the purpose
>> of exporting that attribute?
>
> The way the patch was worded I thought it was referring to an explicit
> mechanism outside cpu cache flushes, i.e. a mechanism that required a
> driver call.
>

This patch is blocked because I am not expressing the details correctly.
I updates this as below. Can you suggest if this is ok? If not what
alternate wording do you suggest to document "memory controller"


commit 329b46e88f8cd30eee4776b0de7913ab4d496bd8
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Wed Dec 18 13:53:16 2019 +0530

    libnvdimm: Update persistence domain value for of_pmem and papr_scm device
    
    Currently, kernel shows the below values
            "persistence_domain":"cpu_cache"
            "persistence_domain":"memory_controller"
            "persistence_domain":"unknown"
    
    "cpu_cache" indicates no extra instructions is needed to ensure the persistence
    of data in the pmem media on power failure.
    
    "memory_controller" indicates cpu cache flush instructions is required to flush
    the data. Platform provides mechanisms to automatically flush outstanding
    write data from memory controler to pmem on system power loss.
    
    Based on the above use memory_controller for non volatile regions on ppc64.
    
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0b4467e378e5..922a4fc3b61b 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -361,8 +361,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 
 	if (p->is_volatile)
 		p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
-	else
+	else {
+		set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
 		p->region = nvdimm_pmem_region_create(p->bus, &ndr_desc);
+	}
 	if (!p->region) {
 		dev_err(dev, "Error registering region %pR from %pOF\n",
 				ndr_desc.res, p->dn);
diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
index 8224d1431ea9..6826a274a1f1 100644
--- a/drivers/nvdimm/of_pmem.c
+++ b/drivers/nvdimm/of_pmem.c
@@ -62,8 +62,10 @@ static int of_pmem_region_probe(struct platform_device *pdev)
 
 		if (is_volatile)
 			region = nvdimm_volatile_region_create(bus, &ndr_desc);
-		else
+		else {
+			set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc.flags);
 			region = nvdimm_pmem_region_create(bus, &ndr_desc);
+		}
 
 		if (!region)
 			dev_warn(&pdev->dev, "Unable to register region %pR from %pOF\n",

