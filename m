Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73604ACABD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 21:51:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsywN2KD9z3bY6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 07:51:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZU8Qf2lQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=dovmurik@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZU8Qf2lQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JswGb6hvcz30Kw
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 05:51:34 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 217IQ4oL001233; 
 Mon, 7 Feb 2022 18:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6wo3fy8YHuqfHQqrTi4jIFOaNA44Ygv455HTfVt4MkA=;
 b=ZU8Qf2lQT4XRQY7Sa2xDY/EY+8aNtQ2qr+N/+KSN+8sG7uhk2Zcn5x9d4VEIRojSV0zN
 35hhA3wfHXzkNl9gb5zcTAkADqAXQB2b3g85NAVHbj/UzLfjzT033uvLdO/wL3hn3VUq
 cdjSTzCbhmhuYOwO5oBU9GG/apZ2GmOwUWp/JhfkRbEZeoTO2czcHbNitfAe0svDwQ9L
 v6LBMWpoN3yAXAqIXq6sWj2srx4K3lVYAvXn/mwBlv402xBSvUAM37mThqQr55rmTabN
 hupI+XQjHerJ71HJoL+PSlcnmVpAGGpxDIlkK+8Ph5Ss+sej/1nV+JyA91h9e8mRYSJK wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22st4em4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:51:02 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 217IdeJT030526;
 Mon, 7 Feb 2022 18:51:01 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e22st4ekm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:51:01 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 217Ilb8b011839;
 Mon, 7 Feb 2022 18:51:00 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3e1gvabq8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 18:51:00 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 217Iovg831785398
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Feb 2022 18:50:57 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC80A6E04E;
 Mon,  7 Feb 2022 18:50:57 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30BE46E052;
 Mon,  7 Feb 2022 18:50:51 +0000 (GMT)
Received: from [9.65.240.79] (unknown [9.65.240.79])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Feb 2022 18:50:50 +0000 (GMT)
Message-ID: <3387b2e7-0921-cd80-279b-24d13f706443@linux.ibm.com>
Date: Mon, 7 Feb 2022 20:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v7 0/5] Allow guest access to EFI confidential computing
 secret area
Content-Language: en-US
To: Matthew Garrett <mjg59@srcf.ucam.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <Yfk6vEuZFtgtA+G+@kroah.com>
 <37779659ca96ac9c1f11bcc0ac0665895c795b54.camel@linux.ibm.com>
 <20220202040157.GA8019@srcf.ucam.org> <YfogOurPZb7+Yelo@kroah.com>
 <20220202065443.GA9249@srcf.ucam.org> <YfotMyQiQ66xfCOQ@kroah.com>
 <20220202071023.GA9489@srcf.ucam.org>
 <CAMj1kXFTyc9KnMsnvs+mt80DbJL8VGKKcQ0J=4NrGYGSAG8sRw@mail.gmail.com>
 <20220202080401.GA9861@srcf.ucam.org>
 <20220202083653.p3cb4w3qdud4e33t@sirius.home.kraxel.org>
 <20220202084534.GA10247@srcf.ucam.org>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <20220202084534.GA10247@srcf.ucam.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kNbeaTLnGVyfzqIU5wFmWGQaLaWnhJPq
X-Proofpoint-ORIG-GUID: -177XkzI6xzpuOjb3dcnAHyLrUUkx8qg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070113
X-Mailman-Approved-At: Tue, 08 Feb 2022 07:50:23 +1100
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
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Lenny Szubowicz <lszubowi@redhat.com>,
 gcwilson@linux.ibm.com, Ard Biesheuvel <ardb@kernel.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@suse.de>,
 "Serge E. Hallyn" <serge@hallyn.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Ashish Kalra <ashish.kalra@amd.com>, dougmill@linux.vnet.ibm.com,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, linux-coco@lists.linux.dev,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>,
 Dave Hansen <dave.hansen@intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-security-module@vger.kernel.org,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Andrew Scull <ascull@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/02/2022 10:45, Matthew Garrett wrote:
> On Wed, Feb 02, 2022 at 09:36:53AM +0100, Gerd Hoffmann wrote:
> 
>> Having a "secrets/" directory looks good to me.  Then the individual
>> implementations can either add files to the directory, i.e. efi_secrets
>> would create "secrets/<guid>" files.  Or each implementation creates a
>> subdirectory with the secrets, i.e. "secrets/coco/" and
>> "secrets/coco/<guid>".
> 
> I prefer a subdirectory, on the basis that we could conceivably end up 
> with more than one implementation on a single device at some point, and 
> also because it makes it trivial for userland to determine what the 
> source is which may make a semantic difference under certain 
> circumstances.
>  

OK, sounds good.  In the next round of the series the module will create
the files in <securityfs>/secrets/coco/ .


>> Longer-term (i.e once we have more than one implementation) we probably
>> need a separate module which owns and manages the "secrets/" directory,
>> and possibly provides some common helper functions too.
> 
> Agree.

Yes; one candidate for such helper function is a filesystem that
implements the "wipe file content from memory on unlink".


-Dov
