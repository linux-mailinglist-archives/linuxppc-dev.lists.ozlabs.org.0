Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6190E12579D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 00:17:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dWBj5J16zDqfH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 10:17:49 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dW8J4rnxzDqk5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 10:15:44 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBIMwow0047568; Wed, 18 Dec 2019 18:15:28 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wyq5qkt8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 18:15:28 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBIN3GI8059370;
 Wed, 18 Dec 2019 18:15:28 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wyq5qkt81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 18:15:28 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBINDRqj026859;
 Wed, 18 Dec 2019 23:15:27 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 2wvqc73udb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Dec 2019 23:15:27 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBINFPeE50790812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 23:15:25 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D37EF6A04D;
 Wed, 18 Dec 2019 23:15:25 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4607A6A04F;
 Wed, 18 Dec 2019 23:15:25 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 18 Dec 2019 23:15:25 +0000 (GMT)
Subject: Re: [PATCH V3 01/13] powerpc/vas: Describe vas-port and interrupts
 properties
From: Haren Myneni <haren@linux.ibm.com>
To: Rob Herring <robh@kernel.org>
In-Reply-To: <20191218221808.GA20302@bogus>
References: <1576561080.16318.6531.camel@hbabu-laptop>
 <1576561720.16318.6532.camel@hbabu-laptop>  <20191218221808.GA20302@bogus>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Dec 2019 15:15:22 -0800
Message-ID: <1576710922.12797.13.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_08:2019-12-17,2019-12-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912180172
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
Cc: devicetree@vger.kernel.org, mikey@neuling.org, herbert@gondor.apana.org.au,
 npiggin@gmail.com, hch@infradead.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-12-18 at 16:18 -0600, Rob Herring wrote:
> On Mon, Dec 16, 2019 at 09:48:40PM -0800, Haren Myneni wrote:
> > 
> 
> Commit message?
> 
> > Signed-off-by: Haren Myneni <haren@us.ibm.com>
> 
> Your author and S-o-b emails don't match.

Thanks, Oliver suggested IRQ assign in the kernel instead of skiboot. In
this case, we may not need this patch. 
> 
> > ---
> >  Documentation/devicetree/bindings/powerpc/ibm,vas.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> > index bf11d2f..12de08b 100644
> > --- a/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> > +++ b/Documentation/devicetree/bindings/powerpc/ibm,vas.txt
> > @@ -11,6 +11,8 @@ Required properties:
> >    window context start and length, OS/User window context start and length,
> >    "Paste address" start and length, "Paste window id" start bit and number
> >    of bits)
> > +- ibm,vas-port : Port address for the interrupt.
> 
> 64-bit?
> 
> > +- interrupts: IRQ value for each VAS instance and level.
> >  
> >  Example:
> >  
> > @@ -18,5 +20,8 @@ Example:
> >  		compatible = "ibm,vas", "ibm,power9-vas";
> >  		reg = <0x6019100000000 0x2000000 0x6019000000000 0x100000000 0x8000000000000 0x100000000 0x20 0x10>;
> >  		name = "vas";
> > +		interrupts = <0x1f 0>;
> > +		interrupt-parent = <&mpic>;
> >  		ibm,vas-id = <0x1>;
> > +		ibm,vas-port = <0x6010001000000>;
> >  	};
> > -- 
> > 1.8.3.1
> > 
> > 
> > 


