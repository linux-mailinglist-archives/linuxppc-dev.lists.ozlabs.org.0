Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D938A24C02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 11:52:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457WJg6qPszDqKv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 19:52:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457WHJ4RPKzDqL7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 19:51:06 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4L9bwYe023368
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 05:51:02 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2smesv0rq1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 05:51:02 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 21 May 2019 10:51:00 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 May 2019 10:50:57 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4L9ouZq19398902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 May 2019 09:50:56 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CC484203F;
 Tue, 21 May 2019 09:50:56 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABB9D42045;
 Tue, 21 May 2019 09:50:55 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.124.31.61])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 May 2019 09:50:55 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH] mm/nvdimm: Use correct #defines instead of opencoding
In-Reply-To: <CAPcyv4jcSgg0wxY9FAM4ke9JzVc9Pu3qe6dviS3seNgHfG2oNw@mail.gmail.com>
References: <20190514025604.9997-1-aneesh.kumar@linux.ibm.com>
 <CAPcyv4iNgFbSq0Hqb+CStRhGWMHfXx7tL3vrDaQ95DcBBY8QCQ@mail.gmail.com>
 <f99c4f11-a43d-c2d3-ab4f-b7072d090351@linux.ibm.com>
 <CAPcyv4gOr8SFbdtBbWhMOU-wdYuMCQ4Jn2SznGRsv6Vku97Xnw@mail.gmail.com>
 <02d1d14d-650b-da38-0828-1af330f594d5@linux.ibm.com>
 <CAPcyv4jcSgg0wxY9FAM4ke9JzVc9Pu3qe6dviS3seNgHfG2oNw@mail.gmail.com>
Date: Tue, 21 May 2019 15:20:54 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19052109-0008-0000-0000-000002E8DFAA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052109-0009-0000-0000-00002255952D
Message-Id: <87mujgcf0h.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-21_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905210062
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
Cc: Linux MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Mon, May 13, 2019 at 9:46 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> On 5/14/19 9:42 AM, Dan Williams wrote:
>> > On Mon, May 13, 2019 at 9:05 PM Aneesh Kumar K.V
>> > <aneesh.kumar@linux.ibm.com> wrote:
>> >>
>> >> On 5/14/19 9:28 AM, Dan Williams wrote:
>> >>> On Mon, May 13, 2019 at 7:56 PM Aneesh Kumar K.V
>> >>> <aneesh.kumar@linux.ibm.com> wrote:
>> >>>>
>> >>>> The nfpn related change is needed to fix the kernel message
>> >>>>
>> >>>> "number of pfns truncated from 2617344 to 163584"
>> >>>>
>> >>>> The change makes sure the nfpns stored in the superblock is right value.
>> >>>>
>> >>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> >>>> ---
>> >>>>    drivers/nvdimm/pfn_devs.c    | 6 +++---
>> >>>>    drivers/nvdimm/region_devs.c | 8 ++++----
>> >>>>    2 files changed, 7 insertions(+), 7 deletions(-)
>> >>>>
>> >>>> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
>> >>>> index 347cab166376..6751ff0296ef 100644
>> >>>> --- a/drivers/nvdimm/pfn_devs.c
>> >>>> +++ b/drivers/nvdimm/pfn_devs.c
>> >>>> @@ -777,8 +777,8 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>> >>>>                    * when populating the vmemmap. This *should* be equal to
>> >>>>                    * PMD_SIZE for most architectures.
>> >>>>                    */
>> >>>> -               offset = ALIGN(start + reserve + 64 * npfns,
>> >>>> -                               max(nd_pfn->align, PMD_SIZE)) - start;
>> >>>> +               offset = ALIGN(start + reserve + sizeof(struct page) * npfns,
>> >>>> +                              max(nd_pfn->align, PMD_SIZE)) - start;
>> >>>
>> >>> No, I think we need to record the page-size into the superblock format
>> >>> otherwise this breaks in debug builds where the struct-page size is
>> >>> extended.
>> >>>
>> >>>>           } else if (nd_pfn->mode == PFN_MODE_RAM)
>> >>>>                   offset = ALIGN(start + reserve, nd_pfn->align) - start;
>> >>>>           else
>> >>>> @@ -790,7 +790,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>> >>>>                   return -ENXIO;
>> >>>>           }
>> >>>>
>> >>>> -       npfns = (size - offset - start_pad - end_trunc) / SZ_4K;
>> >>>> +       npfns = (size - offset - start_pad - end_trunc) / PAGE_SIZE;
>> >>>
>> >>> Similar comment, if the page size is variable then the superblock
>> >>> needs to explicitly account for it.
>> >>>
>> >>
>> >> PAGE_SIZE is not really variable. What we can run into is the issue you
>> >> mentioned above. The size of struct page can change which means the
>> >> reserved space for keeping vmemmap in device may not be sufficient for
>> >> certain kernel builds.
>> >>
>> >> I was planning to add another patch that fails namespace init if we
>> >> don't have enough space to keep the struct page.
>> >>
>> >> Why do you suggest we need to have PAGE_SIZE as part of pfn superblock?
>> >
>> > So that the kernel has a chance to identify cases where the superblock
>> > it is handling was created on a system with different PAGE_SIZE
>> > assumptions.
>> >
>>
>> The reason to do that is we don't have enough space to keep struct page
>> backing the total number of pfns? If so, what i suggested above should
>> handle that.
>>
>> or are you finding any other reason why we should fail a namespace init
>> with a different PAGE_SIZE value?
>
> I want the kernel to be able to start understand cross-architecture
> and cross-configuration geometries. Which to me means incrementing the
> info-block version and recording PAGE_SIZE and sizeof(struct page) in
> the info-block directly.
>
>> My another patch handle the details w.r.t devdax alignment for which
>> devdax got created with PAGE_SIZE 4K but we are now trying to load that
>> in a kernel with PAGE_SIZE 64k.
>
> Sure, but what about the reverse? These info-block format assumptions
> are as fundamental as the byte-order of the info-block, it needs to be
> cross-arch compatible and the x86 assumptions need to be fully lifted.

Something like the below (Not tested). I am not sure what we will init the page_size
for minor version < 3. This will mark the namespace disabled if the
PAGE_SIZE and sizeof(struct page) doesn't match with the values used
during namespace create. 

diff --git a/drivers/nvdimm/pfn.h b/drivers/nvdimm/pfn.h
index dde9853453d3..d6e0933d0dd4 100644
--- a/drivers/nvdimm/pfn.h
+++ b/drivers/nvdimm/pfn.h
@@ -36,6 +36,9 @@ struct nd_pfn_sb {
 	__le32 end_trunc;
 	/* minor-version-2 record the base alignment of the mapping */
 	__le32 align;
+	/* minor-version-3 record the page size and struct page size */
+	__le32 page_size;
+	__le32 page_struct_size;
 	u8 padding[4000];
 	__le64 checksum;
 };
diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
index 6f9f78858018..bbc1d792d7f3 100644
--- a/drivers/nvdimm/pfn_devs.c
+++ b/drivers/nvdimm/pfn_devs.c
@@ -477,6 +477,15 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
 	if (__le16_to_cpu(pfn_sb->version_minor) < 2)
 		pfn_sb->align = 0;
 
+	if (__le16_to_cpu(pfn_sb->version_minor) < 3) {
+		/*
+		 * For a large part we use PAGE_SIZE. But we
+		 * do have some accounting code using SIZE_4K.
+		 */
+		pfn_sb->page_size = cpu_to_le32(PAGE_SIZE);
+		pfn_sb->page_struct_size = cpu_to_le32(64);
+	}
+
 	switch (le32_to_cpu(pfn_sb->mode)) {
 	case PFN_MODE_RAM:
 	case PFN_MODE_PMEM:
@@ -504,6 +513,12 @@ int nd_pfn_validate(struct nd_pfn *nd_pfn, const char *sig)
 		return -EOPNOTSUPP;
 	}
 
+	if (le32_to_cpu(pfn_sb->page_size) != PAGE_SIZE)
+		return -EOPNOTSUPP;
+
+	if (le32_to_cpu(pfn_sb->page_struct_size) != sizeof(struct page))
+		return -EOPNOTSUPP;
+
 	if (!nd_pfn->uuid) {
 		/*
 		 * When probing a namepace via nd_pfn_probe() the uuid
@@ -798,7 +813,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
 	memcpy(pfn_sb->uuid, nd_pfn->uuid, 16);
 	memcpy(pfn_sb->parent_uuid, nd_dev_to_uuid(&ndns->dev), 16);
 	pfn_sb->version_major = cpu_to_le16(1);
-	pfn_sb->version_minor = cpu_to_le16(2);
+	pfn_sb->version_minor = cpu_to_le16(3);
 	pfn_sb->start_pad = cpu_to_le32(start_pad);
 	pfn_sb->end_trunc = cpu_to_le32(end_trunc);
 	pfn_sb->align = cpu_to_le32(nd_pfn->align);

