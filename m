Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37482191FD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 04:51:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nDgK36kFzDqPw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 14:51:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nDd13qPtzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 14:49:09 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02P3XqOJ101823; Tue, 24 Mar 2020 23:49:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0pr2wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 23:48:59 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02P3jm0Y030763;
 Tue, 24 Mar 2020 23:48:59 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf0pr2wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Mar 2020 23:48:59 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02P3kl8d007174;
 Wed, 25 Mar 2020 03:48:58 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 2ywawfwt9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Mar 2020 03:48:58 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02P3mvSB40239406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 03:48:57 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 292496A051;
 Wed, 25 Mar 2020 03:48:57 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B1616A04D;
 Wed, 25 Mar 2020 03:48:56 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 25 Mar 2020 03:48:56 +0000 (GMT)
Subject: Re: [PATCH v4 3/9] powerpc/vas: Add VAS user space API
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <87zhc6xvuk.fsf@mpe.ellerman.id.au>
References: <1584934879.9256.15321.camel@hbabu-laptop>
 <1584936142.9256.15325.camel@hbabu-laptop>
 <878sjrwm72.fsf@dja-thinkpad.axtens.net>
 <878sjrclmz.fsf@mpe.ellerman.id.au>
 <875zevw61j.fsf@dja-thinkpad.axtens.net>
 <87zhc6xvuk.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Mar 2020 20:48:23 -0700
Message-ID: <1585108103.10664.391.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_10:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 mlxlogscore=772 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003250030
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-03-24 at 14:41 +1100, Michael Ellerman wrote:
> Daniel Axtens <dja@axtens.net> writes:
> > Michael Ellerman <mpe@ellerman.id.au> writes:
> >> Daniel Axtens <dja@axtens.net> writes:
> >>> Haren Myneni <haren@linux.ibm.com> writes:
> >>>> diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/platforms/powernv/vas-api.c
> >>>> new file mode 100644
> >>>> index 0000000..7d049af
> >>>> --- /dev/null
> >>>> +++ b/arch/powerpc/platforms/powernv/vas-api.c
> >>>> @@ -0,0 +1,257 @@
> >> ...
> >>>> +
> >>>> +static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
> >>>> +{
> >>>> +	struct vas_window *txwin = fp->private_data;
> >>>> +	unsigned long pfn;
> >>>> +	u64 paste_addr;
> >>>> +	pgprot_t prot;
> >>>> +	int rc;
> >>>> +
> >>>> +	if ((vma->vm_end - vma->vm_start) > PAGE_SIZE) {
> >>>
> >>> I think you said this should be 4096 rather than 64k, regardless of what
> >>> PAGE_SIZE you are compiled with?
> >>
> >> You can't mmap less than a page, a page is PAGE_SIZE bytes.
> >>
> >> So if that checked for 4K explicitly it would prevent mmap on 64K
> >> kernels always, which seems like not what you want?
> >
> > Ah. My bad. Carry on then :)
> 
> Well you were just quoting something from Haren, so I think it's over to
> him.

Sorry my mistake. 

I should change in documentation. vas_win_paste_addr() always returns 1
page. Restriction should be PAGE_SIZE. 

> 
> cheers


