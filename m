Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E4C76DFDC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 07:47:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QVGIak8n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGdCs22LBz3bxB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 15:47:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QVGIak8n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGdBy5FVKz2yhS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 15:46:50 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3735gMq4027036;
	Thu, 3 Aug 2023 05:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dRolJn+krV/ITKG1jffzCOnmUCoH4C2lfFRoAe9Al0U=;
 b=QVGIak8nQY7yNvy3wIg89QKOK9wqvwLEq/hrkWJUJuieqGhH+CIn1B73DOMnOApZyFY0
 t3Q898wKJtm4HlTwUFUSLMVoEZkWQHnF/bwz436Dz/6a7lrLWsApo04ebQ7bNVrEKnEe
 qLKc9hU1yuomASOr42/AazAPXwIQCFV1S3biiNjy9jUdAqqGfTPpFOxWhHfMCWNxgDgS
 TiQRzJurxhX3RpOW+xxOeY4i6ZOnIFru/xLrOd2D1xjOq3IqiSsw6tGTGf3tUbrpLgpR
 qS7vnX5S/imIhujZKn2/I+F10vqBTz2AT/jaIgZs+743FlJ4D4SGrJBGYReXyBQqSbwH CA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s865j05ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 05:46:41 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3735gnuV029965;
	Thu, 3 Aug 2023 05:46:41 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s865j05e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 05:46:41 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37351sWp006161;
	Thu, 3 Aug 2023 05:46:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5d3sucdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Aug 2023 05:46:40 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3735kcEr35979830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Aug 2023 05:46:38 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A8B620040;
	Thu,  3 Aug 2023 05:46:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB64820043;
	Thu,  3 Aug 2023 05:46:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  3 Aug 2023 05:46:37 +0000 (GMT)
Received: from [9.43.189.172] (unknown [9.43.189.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7108160367;
	Thu,  3 Aug 2023 15:46:29 +1000 (AEST)
Message-ID: <dc30eea1-a977-7ee2-9975-d623ba401c84@linux.ibm.com>
Date: Thu, 3 Aug 2023 15:46:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] powerpc/xmon: use KSYM_NAME_LEN in array size
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Maninder Singh <maninder1.s@samsung.com>
References: <CGME20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5@epcas5p2.samsung.com>
 <20230529111337.352990-1-maninder1.s@samsung.com>
 <20230529111337.352990-2-maninder1.s@samsung.com>
 <CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com>
Content-Language: en-US, en-AU
From: Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VXRQbZ8dcoq9jXmGaZ_M-e4Fpkx6PrjV
X-Proofpoint-ORIG-GUID: _w7nMIAEmPg8Yi6WLqxm2fqjtLSpVY_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_03,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 spamscore=0 mlxlogscore=740
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308030050
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
Cc: nathanl@linux.ibm.com, bcain@quicinc.com, keescook@chromium.org, pmladek@suse.com, linux-hexagon@vger.kernel.org, ustavoars@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, alex.gaynor@gmail.com, Onkarnath <onkarnath.1@samsung.com>, wedsonaf@google.com, gary@garyguo.net, ojeda@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30/5/23 10:54 pm, Miguel Ojeda wrote:
> Side-note: in `get_function_bounds()`, I see `kallsyms_lookup()` being
> used, but the name seems discarded? Can
> `kallsyms_lookup_size_offset()` be used instead, thus avoiding the
> usage of the buffer there to begin with?

I'm not familiar with the kallsyms infrastructure, but looking over the 
implementations of kallsyms_lookup() and kallsyms_lookup_size_offset() 
it looks like the existing kallsyms_lookup()
  handles an extra case over kallsyms_lookup_size_offset()?

kallsyms_lookup_buildid() (the implementation of kallsyms_lookup()) has

   /* See if it's in a module or a BPF JITed image. */
   ret = module_address_lookup(addr, symbolsize, offset,
                               modname, modbuildid, namebuf);
   if (!ret)
           ret = bpf_address_lookup(addr, symbolsize,
                                    offset, modname, namebuf);

   if (!ret)
           ret = ftrace_mod_address_lookup(addr, symbolsize,
                                           offset, modname, namebuf);

while kallsyms_lookup_size_offset() is missing the ftrace case

   return !!module_address_lookup(addr, symbolsize, offset,
                                  NULL, NULL, namebuf) ||
          !!__bpf_address_lookup(addr, symbolsize, offset, namebuf);

Might this be a concern for xmon?
