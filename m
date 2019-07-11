Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6826515A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 07:10:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kkfF1wYdzDqgq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 15:10:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bharata@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kkcK3GrbzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 15:09:04 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6B57II9087135
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:09:00 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tnvf3m0te-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:09:00 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Thu, 11 Jul 2019 06:08:58 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 11 Jul 2019 06:08:54 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6B58rGX34406748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Jul 2019 05:08:53 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48B5D4C044;
 Thu, 11 Jul 2019 05:08:53 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F6BA4C04A;
 Thu, 11 Jul 2019 05:08:51 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.85.188])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 11 Jul 2019 05:08:51 +0000 (GMT)
Date: Thu, 11 Jul 2019 10:38:48 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v5 1/7] kvmppc: HMM backend driver to manage pages of
 secure guest
References: <20190709102545.9187-1-bharata@linux.ibm.com>
 <20190709102545.9187-2-bharata@linux.ibm.com>
 <29e536f225036d2a93e653c56a961fcb@linux.vnet.ibm.com>
 <20190710134734.GB2873@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190710134734.GB2873@ziepe.ca>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-TM-AS-GCONF: 00
x-cbid: 19071105-0028-0000-0000-0000038315C2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071105-0029-0000-0000-00002443285B
Message-Id: <20190711050848.GB12321@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907110059
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
Reply-To: bharata@linux.ibm.com
Cc: linuxram@us.ibm.com, cclaudio@linux.ibm.com, kvm-ppc@vger.kernel.org,
 Linuxppc-dev <linuxppc-dev-bounces+janani=linux.ibm.com@lists.ozlabs.org>,
 linux-mm@kvack.org, jglisse@redhat.com, janani <janani@linux.ibm.com>,
 aneesh.kumar@linux.vnet.ibm.com, paulus@au1.ibm.com,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 10, 2019 at 10:47:34AM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 09, 2019 at 01:55:28PM -0500, janani wrote:
> 
> > > +int kvmppc_hmm_init(void)
> > > +{
> > > +	int ret = 0;
> > > +	unsigned long size;
> > > +
> > > +	size = kvmppc_get_secmem_size();
> > > +	if (!size) {
> > > +		ret = -ENODEV;
> > > +		goto out;
> > > +	}
> > > +
> > > +	kvmppc_hmm.device = hmm_device_new(NULL);
> > > +	if (IS_ERR(kvmppc_hmm.device)) {
> > > +		ret = PTR_ERR(kvmppc_hmm.device);
> > > +		goto out;
> > > +	}
> > > +
> > > +	kvmppc_hmm.devmem = hmm_devmem_add(&kvmppc_hmm_devmem_ops,
> > > +					   &kvmppc_hmm.device->device, size);
> > > +	if (IS_ERR(kvmppc_hmm.devmem)) {
> > > +		ret = PTR_ERR(kvmppc_hmm.devmem);
> > > +		goto out_device;
> > > +	}
> 
> This 'hmm_device' API family was recently deleted from hmm:

Hmmm... I still find it in upstream, guess it will be removed soon?

I find the below commit in mmotm.

> 
> commit 07ec38917e68f0114b9c8aeeb1c584b5e73e4dd6
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Wed Jun 26 14:27:01 2019 +0200
> 
>     mm: remove the struct hmm_device infrastructure
>     
>     This code is a trivial wrapper around device model helpers, which
>     should have been integrated into the driver device model usage from
>     the start.  Assuming it actually had users, which it never had since
>     the code was added more than 1 1/2 years ago.
> 
> This patch should use the driver core directly instead.
> 
> Regards,
> Jason

