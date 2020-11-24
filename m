Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A41FC2C3207
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:36:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgbQl6PvszDqbX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 07:36:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clombard@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AzRnCeFn; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgVNP1Gw4zDqX3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 03:49:08 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AOGl4vM075166; Tue, 24 Nov 2020 11:49:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=7/1Xab7EducQRmywL3YalgepWrjPXnyvmk6FGsf9OeU=;
 b=AzRnCeFnfqJgauQwHM1MmbM8gOJC7YWck50PywDvRiGBYKq2MqrzKfZJEupzJ2H+ZU3E
 OGcmqu7wLmbgEPxMHTN+wVctIhPpUIMrPA6S/bCpra0orxDP1csJuS+3Doa++7S61crt
 qH/4/ONorCHOZJRW+28WtKejt5bpQZC3+iJuAFtKfKXZPOXheNaL6GbyPDS+uKfg2ct5
 C+MZ6AUdfcgmgz4vg5om1nHvytU8reW8kw25Pm43BIE0e7BbWZ84MmpPR5QrM8GOS3SY
 JxbSmXfozMEUpylxD4cztCa23C+2P3vm96PQRcyHzuTZhGn56qZ0MrTFQfjBXrlu6LCk aw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350fe1cxv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 11:49:00 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AOGWNaF010649;
 Tue, 24 Nov 2020 16:48:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 34xt5hbu8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 16:48:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AOGmtRR57475474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 16:48:55 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EA9E52063;
 Tue, 24 Nov 2020 16:48:55 +0000 (GMT)
Received: from [9.171.10.118] (unknown [9.171.10.118])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4A78B52050;
 Tue, 24 Nov 2020 16:48:55 +0000 (GMT)
Subject: Re: [PATCH V2 4/5] ocxl: Add mmu notifier
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@infradead.org>
References: <20201120173241.59229-1-clombard@linux.vnet.ibm.com>
 <20201120173241.59229-5-clombard@linux.vnet.ibm.com>
 <20201124091738.GA26078@infradead.org> <20201124134525.GB4800@nvidia.com>
From: Christophe Lombard <clombard@linux.vnet.ibm.com>
Message-ID: <43ad6f31-5778-e974-8671-43710a301df3@linux.vnet.ibm.com>
Date: Tue, 24 Nov 2020 17:48:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124134525.GB4800@nvidia.com>
Content-Type: multipart/alternative;
 boundary="------------5E28E81E664EF13F7AA85057"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0
 clxscore=1011 adultscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240103
X-Mailman-Approved-At: Wed, 25 Nov 2020 07:34:54 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com,
 fbarrat@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------5E28E81E664EF13F7AA85057
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 24/11/2020 à 14:45, Jason Gunthorpe a écrit :
> On Tue, Nov 24, 2020 at 09:17:38AM +0000, Christoph Hellwig wrote:
>
>>> @@ -470,6 +487,26 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
>>>   }
>>>   EXPORT_SYMBOL_GPL(ocxl_link_release);
>>>   
>>> +static void invalidate_range(struct mmu_notifier *mn,
>>> +			     struct mm_struct *mm,
>>> +			     unsigned long start, unsigned long end)
>>> +{
>>> +	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
>>> +	struct ocxl_link *link = pe_data->link;
>>> +	unsigned long addr, pid, page_size = PAGE_SIZE;
> The page_size variable seems unnecessary
>
>>> +
>>> +	pid = mm->context.id;
>>> +
>>> +	spin_lock(&link->atsd_lock);
>>> +	for (addr = start; addr < end; addr += page_size)
>>> +		pnv_ocxl_tlb_invalidate(&link->arva, pid, addr);
>>> +	spin_unlock(&link->atsd_lock);
>>> +}
>>> +
>>> +static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
>>> +	.invalidate_range = invalidate_range,
>>> +};
>>> +
>>>   static u64 calculate_cfg_state(bool kernel)
>>>   {
>>>   	u64 state;
>>> @@ -526,6 +563,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>>>   	pe_data->mm = mm;
>>>   	pe_data->xsl_err_cb = xsl_err_cb;
>>>   	pe_data->xsl_err_data = xsl_err_data;
>>> +	pe_data->link = link;
>>> +	pe_data->mmu_notifier.ops = &ocxl_mmu_notifier_ops;
>>>   
>>>   	memset(pe, 0, sizeof(struct ocxl_process_element));
>>>   	pe->config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
>>> @@ -542,8 +581,16 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
>>>   	 * by the nest MMU. If we have a kernel context, TLBIs are
>>>   	 * already global.
>>>   	 */
>>> -	if (mm)
>>> +	if (mm) {
>>>   		mm_context_add_copro(mm);
>>> +		if (link->arva) {
>>> +			/* Use MMIO registers for the TLB Invalidate
>>> +			 * operations.
>>> +			 */
>>> +			mmu_notifier_register(&pe_data->mmu_notifier, mm);
> Every other place doing stuff like this is de-duplicating the
> notifier. If you have multiple clients this will do multiple redundant
> invalidations?

We could have multiple clients, although not something that we have often.
We have only one attach per process. But if not, we must still have 
invalidation for each.

>
> The notifier get/put API is designed to solve that problem, you'd get
> a single notifier for the mm and then add the impacted arva's to some
> list at the notifier.

Thanks for the information.
>
> Jason

--------------5E28E81E664EF13F7AA85057
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Le 24/11/2020 à 14:45, Jason Gunthorpe
      a écrit :<br>
    </div>
    <blockquote type="cite" cite="mid:20201124134525.GB4800@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Nov 24, 2020 at 09:17:38AM +0000, Christoph Hellwig wrote:

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">@@ -470,6 +487,26 @@ void ocxl_link_release(struct pci_dev *dev, void *link_handle)
 }
 EXPORT_SYMBOL_GPL(ocxl_link_release);
 
+static void invalidate_range(struct mmu_notifier *mn,
+			     struct mm_struct *mm,
+			     unsigned long start, unsigned long end)
+{
+	struct pe_data *pe_data = container_of(mn, struct pe_data, mmu_notifier);
+	struct ocxl_link *link = pe_data-&gt;link;
+	unsigned long addr, pid, page_size = PAGE_SIZE;
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The page_size variable seems unnecessary

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+	pid = mm-&gt;context.id;
+
+	spin_lock(&amp;link-&gt;atsd_lock);
+	for (addr = start; addr &lt; end; addr += page_size)
+		pnv_ocxl_tlb_invalidate(&amp;link-&gt;arva, pid, addr);
+	spin_unlock(&amp;link-&gt;atsd_lock);
+}
+
+static const struct mmu_notifier_ops ocxl_mmu_notifier_ops = {
+	.invalidate_range = invalidate_range,
+};
+
 static u64 calculate_cfg_state(bool kernel)
 {
 	u64 state;
@@ -526,6 +563,8 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 	pe_data-&gt;mm = mm;
 	pe_data-&gt;xsl_err_cb = xsl_err_cb;
 	pe_data-&gt;xsl_err_data = xsl_err_data;
+	pe_data-&gt;link = link;
+	pe_data-&gt;mmu_notifier.ops = &amp;ocxl_mmu_notifier_ops;
 
 	memset(pe, 0, sizeof(struct ocxl_process_element));
 	pe-&gt;config_state = cpu_to_be64(calculate_cfg_state(pidr == 0));
@@ -542,8 +581,16 @@ int ocxl_link_add_pe(void *link_handle, int pasid, u32 pidr, u32 tidr,
 	 * by the nest MMU. If we have a kernel context, TLBIs are
 	 * already global.
 	 */
-	if (mm)
+	if (mm) {
 		mm_context_add_copro(mm);
+		if (link-&gt;arva) {
+			/* Use MMIO registers for the TLB Invalidate
+			 * operations.
+			 */
+			mmu_notifier_register(&amp;pe_data-&gt;mmu_notifier, mm);
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Every other place doing stuff like this is de-duplicating the
notifier. If you have multiple clients this will do multiple redundant
invalidations?</pre>
    </blockquote>
    <font size="-1"></font><br>
    <font size="-1">We could have multiple clients, although not
      something that we have often. <br>
    </font><font size="-1">We have only one attach</font>
    <font size="-1">per process. </font><font size="-1"><span
        class="tlid-translation translation" lang="en"><span title=""
          class="">But if not, we must still have invalidation for each</span></span></font>.<br>
    <br>
    <blockquote type="cite" cite="mid:20201124134525.GB4800@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

The notifier get/put API is designed to solve that problem, you'd get
a single notifier for the mm and then add the impacted arva's to some
list at the notifier.</pre>
    </blockquote>
    <font size="-1"><br>
      Thanks for the information. </font><br>
    <blockquote type="cite" cite="mid:20201124134525.GB4800@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
  </body>
</html>

--------------5E28E81E664EF13F7AA85057--

