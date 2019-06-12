Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD0431BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 00:42:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PMMJ5N39zDqdv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 08:42:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PKGh46XVzDqsb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 07:08:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45PKGh0XyVz8t3y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 07:08:28 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45PKGh094Dz9sBb; Thu, 13 Jun 2019 07:08:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45PKGg3v0Bz9s4Y;
 Thu, 13 Jun 2019 07:08:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5CL5AA6053524; Wed, 12 Jun 2019 17:08:16 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t373gma3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2019 17:08:16 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5CGQpCv025957;
 Wed, 12 Jun 2019 16:30:02 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 2t1x6ssrcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jun 2019 16:30:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5CL8D5911731236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jun 2019 21:08:13 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CA4EB2067;
 Wed, 12 Jun 2019 21:08:13 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A879B2079;
 Wed, 12 Jun 2019 21:08:12 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.138.41])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jun 2019 21:08:12 +0000 (GMT)
Subject: Re: [PATCH v3 1/3] powerpc/powernv: Add OPAL API interface to get
 secureboot state
To: Daniel Axtens <dja@axtens.net>, Nayna Jain <nayna@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1560198837-18857-1-git-send-email-nayna@linux.ibm.com>
 <1560198837-18857-2-git-send-email-nayna@linux.ibm.com>
 <87ftofpbth.fsf@dja-thinkpad.axtens.net>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <eaa37bd0-a77d-d70a-feb5-c0e73ce231bf@linux.vnet.ibm.com>
Date: Wed, 12 Jun 2019 17:08:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87ftofpbth.fsf@dja-thinkpad.axtens.net>
Content-Type: multipart/alternative;
 boundary="------------94B64B1CEF39324F1BD5A777"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120145
X-Mailman-Approved-At: Thu, 13 Jun 2019 08:39:12 +1000
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Richter <erichte@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------94B64B1CEF39324F1BD5A777
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/12/2019 02:17 AM, Daniel Axtens wrote:
> Nayna Jain <nayna@linux.ibm.com> writes:
>
>> From: Claudio Carvalho <cclaudio@linux.ibm.com>
>>
>> The X.509 certificates trusted by the platform and other information
>> required to secure boot the OS kernel are wrapped in secure variables,
>> which are controlled by OPAL.
>>
>> This patch adds support to read OPAL secure variables through
>> OPAL_SECVAR_GET call. It returns the metadata and data for a given secure
>> variable based on the unique key.
>>
>> Since OPAL can support different types of backend which can vary in the
>> variable interpretation, a new OPAL API call named OPAL_SECVAR_BACKEND, is
>> added to retrieve the supported backend version. This helps the consumer
>> to know how to interpret the variable.
>>
> (Firstly, apologies that I haven't got around to asking about this yet!)
>
> Are pluggable/versioned backend a good idea?
>
> There are a few things that worry me about the idea:
>
>   - It adds complexity in crypto (or crypto-adjacent) code, and that
>     increases the likelihood that we'll accidentally add a bug with bad
>     consequences.

Sorry, I think I am not clear on what exactly you mean here.Can you 
please elaborate or give specifics ?


>
>   - Under what circumstances would would we change the kernel-visible
>     behaviour of skiboot? Are we expecting to change the behaviour,
>     content or names of the variables in future? Otherwise the only
>     relevant change I can think of is a change to hardware platforms, and
>     I'm not sure how a change in hardware would lead to change in
>     behaviour in the kernel. Wouldn't Skiboot hide h/w differences?

Backends are intended to be an agreement for firmware, kernel and 
userspace on what the format of variables are, what variables should be 
expected, how they should be signed, etc. Though we don't expect it to 
happen very often, we want to anticipate possible changes in the 
firmware which may affect the kernel such as new features, support of 
new authentication mechanisms, addition of new variables. Corresponding 
skiboot patches are on - 
https://lists.ozlabs.org/pipermail/skiboot/2019-June/014641.html


>
>   - If we are worried about a long-term-future change to how secure-boot
>     works, would it be better to just add more get/set calls to opal at
>     the point at which we actually implement the new system?

The intention is to avoid to re-implement the key/value interface for 
each scheme. Do you mean to deprecate the old APIs and add new APIs with 
every scheme ?


>     
>   - UEFI added EFI_VARIABLE_AUTHENTICATION_3 in a way that - as far
>     as I know - didn't break backwards compatibility. Is there a reason
>     we cannot add features that way instead? (It also dropped v1 of the
>     authentication header.)
>     
>   - What is the correct fallback behaviour if a kernel receives a result
>     that it does not expect? If a kernel expecting BackendV1 is instead
>     informed that it is running on BackendV2, then the cannot access the
>     secure variable at all, so it cannot load keys that are potentially
>     required to successfully boot (e.g. to validate the module for
>     network card or graphics!)

The backend is declaredby the firmware, and is set at compile-time. The 
kernel queriesfirmware on whichbackend is in use, and the backend will 
not change at runtime.If the backend in use by the firmware is not 
supported by the kernel (e.g. kernel is too old), the kernel does not 
attempt to read any secure variables, as it won't understand what the 
format is. This is a secure boot failure condition, as we cannot verify 
the next kernel. With addition of new backends in the skiboot, the 
support will be added to the kernel. Note: skiboot and skiroot should 
always be in sync with backend support.


Thanks & Regards,
     - Nayna


--------------94B64B1CEF39324F1BD5A777
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 06/12/2019 02:17 AM, Daniel Axtens
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:87ftofpbth.fsf@dja-thinkpad.axtens.net">
      <pre wrap="">Nayna Jain <a class="moz-txt-link-rfc2396E" href="mailto:nayna@linux.ibm.com">&lt;nayna@linux.ibm.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre wrap="">From: Claudio Carvalho <a class="moz-txt-link-rfc2396E" href="mailto:cclaudio@linux.ibm.com">&lt;cclaudio@linux.ibm.com&gt;</a>

The X.509 certificates trusted by the platform and other information
required to secure boot the OS kernel are wrapped in secure variables,
which are controlled by OPAL.

This patch adds support to read OPAL secure variables through
OPAL_SECVAR_GET call. It returns the metadata and data for a given secure
variable based on the unique key.

Since OPAL can support different types of backend which can vary in the
variable interpretation, a new OPAL API call named OPAL_SECVAR_BACKEND, is
added to retrieve the supported backend version. This helps the consumer
to know how to interpret the variable.

</pre>
      </blockquote>
      <pre wrap="">
(Firstly, apologies that I haven't got around to asking about this yet!)

Are pluggable/versioned backend a good idea?

There are a few things that worry me about the idea:

 - It adds complexity in crypto (or crypto-adjacent) code, and that
   increases the likelihood that we'll accidentally add a bug with bad
   consequences.</pre>
    </blockquote>
    <br>
    <span class="author-6932218873" style="font-family: Lato,
      &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
      font-size: 14px; color: rgb(34, 34, 34);">Sorry, I think I am not
      clear on what exactly you mean here.</span><span
      class="author-6932218873 font-color-000000 font-size-medium"
      style="color: rgb(34, 34, 34); font-family: Lato, &quot;Helvetica
      Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;"> </span><span
      class="author-6932218873" style="font-family: Lato,
      &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
      font-size: 14px; color: rgb(34, 34, 34);">Can you please elaborate
      or give specifics ?</span><br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:87ftofpbth.fsf@dja-thinkpad.axtens.net">
      <pre wrap="">

 - Under what circumstances would would we change the kernel-visible
   behaviour of skiboot? Are we expecting to change the behaviour,
   content or names of the variables in future? Otherwise the only
   relevant change I can think of is a change to hardware platforms, and
   I'm not sure how a change in hardware would lead to change in
   behaviour in the kernel. Wouldn't Skiboot hide h/w differences?</pre>
    </blockquote>
    <br>
    <span class="author-6932218873" style="font-family: Lato,
      &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
      font-size: 14px; color: rgb(34, 34, 34);">Backends are intended to
      be an agreement for firmware, kernel and userspace on what the
      format of variables are, what variables should be expected, how
      they should be signed, etc. Though we don't expect it to happen
      very often, we want to anticipate possible changes in the firmware
      which may affect the kernel such as new features, support of new
      authentication mechanisms, addition of new variables.
      Corresponding skiboot patches are on - </span><span
      class="author-6932218873
link-MTU2MDM3MzE4NDE1My1odHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL3NraWJvb3QvMjAxOS1KdW5lLzAxNDY0MS5odG1s"
      style="font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica,
      Arial, sans-serif; font-size: 14px; color: rgb(34, 34, 34);"><a
        href="https://lists.ozlabs.org/pipermail/skiboot/2019-June/014641.html"
        target="_blank" rel="noreferrer nofollow" class="link"
data-attrib-id="MTU2MDM3MzE4NDE1My1odHRwczovL2xpc3RzLm96bGFicy5vcmcvcGlwZXJtYWlsL3NraWJvb3QvMjAxOS1KdW5lLzAxNDY0MS5odG1s">https://lists.ozlabs.org/pipermail/skiboot/2019-June/014641.html</a></span><br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:87ftofpbth.fsf@dja-thinkpad.axtens.net">
      <pre wrap="">

 - If we are worried about a long-term-future change to how secure-boot
   works, would it be better to just add more get/set calls to opal at
   the point at which we actually implement the new system?</pre>
    </blockquote>
    <br>
    <span class="author-6932218873 font-color-000000 font-size-medium"
      style="color: rgb(34, 34, 34); font-family: Lato, &quot;Helvetica
      Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;">The
      intention is to avoid to re-implement the key/value interface for
      each scheme. Do yo</span><span class="author-6932218873"
      style="font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica,
      Arial, sans-serif; font-size: 14px; color: rgb(34, 34, 34);">u
      mean to deprecate the old APIs and add new APIs with every scheme
      ?</span><br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:87ftofpbth.fsf@dja-thinkpad.axtens.net">
      <pre wrap="">
   
 - UEFI added EFI_VARIABLE_AUTHENTICATION_3 in a way that - as far
   as I know - didn't break backwards compatibility. Is there a reason
   we cannot add features that way instead? (It also dropped v1 of the
   authentication header.)
   
 - What is the correct fallback behaviour if a kernel receives a result
   that it does not expect? If a kernel expecting BackendV1 is instead
   informed that it is running on BackendV2, then the cannot access the
   secure variable at all, so it cannot load keys that are potentially
   required to successfully boot (e.g. to validate the module for
   network card or graphics!)</pre>
    </blockquote>
    <br>
    <div data-node-type="line" id="magicdomid1119" class="ace-line"><span
        class="author-6932218873 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;">The backend is </span><span
        class="author-270238033 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;">declared</span><span class="author-6932218873
        font-color-000000 font-size-medium" style="color: rgb(34, 34,
        34); font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica,
        Arial, sans-serif; font-size: 14px;"> by the firmware, </span><span
        class="author-270238033 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;">and is set at compile-time. T</span><span
        class="author-6932218873 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;">he kernel </span><span
        class="author-270238033 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;">queries</span><span class="author-6932218873
        font-color-000000 font-size-medium" style="color: rgb(34, 34,
        34); font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica,
        Arial, sans-serif; font-size: 14px;"> firmware </span><span
        class="author-270238033 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;">on which</span><span class="author-6932218873
        font-color-000000 font-size-medium" style="color: rgb(34, 34,
        34); font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica,
        Arial, sans-serif; font-size: 14px;"> backend </span><span
        class="author-270238033 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;">is in use, and the backend will not change at
        runtime.</span><span class="author-6932218873 font-color-000000
        font-size-medium" style="color: rgb(34, 34, 34); font-family:
        Lato, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;"> </span><span class="author-270238033
        font-color-000000 font-size-medium" style="color: rgb(34, 34,
        34); font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica,
        Arial, sans-serif; font-size: 14px;">If the backend in use by
        the firmware is not supported by the kernel (e.g. kernel is too
        old), the kernel does not attempt to read any secure variables,
        as it won't understand what the format is. This is a secure boot
        failure condition, as we cannot verify the next kernel. </span><span
        class="author-270238033 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;"><span class="author-6932218873
          font-color-000000 font-size-medium" style="color: rgb(34, 34,
          34); font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica,
          Arial, sans-serif; font-size: 14px;">With addition of new
          backends in the skiboot, the support will be added to the
          kernel.</span> Note: skiboot and skiroot should always be in
        sync with backend support.</span><span class="author-6932218873
        font-color-000000 font-size-medium" style="color: rgb(34, 34,
        34); font-family: Lato, &quot;Helvetica Neue&quot;, Helvetica,
        Arial, sans-serif; font-size: 14px;"> </span></div>
    <div data-node-type="line" id="magicdomid1320" class="ace-line"><span
        class="author-6932218873 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;"></span><br>
      <span class="author-6932218873 font-color-000000 font-size-medium"
        style="color: rgb(34, 34, 34); font-family: Lato,
        &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;
        font-size: 14px;"></span></div>
    <br>
    Thanks &amp; Regards,<br>
        - Nayna<br>
    <br>
  </body>
</html>

--------------94B64B1CEF39324F1BD5A777--

