Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3E349677F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 22:43:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgXv14sz9z3bZ5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 08:43:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=jilayne.com header.i=@jilayne.com header.a=rsa-sha256 header.s=default header.b=XByOCaEv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=jilayne.com
 (client-ip=198.23.53.39; helo=mx1.supremebox.com;
 envelope-from=opensource@jilayne.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=jilayne.com
 header.i=@jilayne.com header.a=rsa-sha256 header.s=default header.b=XByOCaEv; 
 dkim-atps=neutral
X-Greylist: delayed 2319 seconds by postgrey-1.36 at boromir;
 Sat, 22 Jan 2022 06:13:41 AEDT
Received: from mx1.supremebox.com (mx1.supremebox.com [198.23.53.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgTYx67Zjz30NC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 06:13:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jilayne.com
 ; s=default;
 h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1OAlzCIuUjeLvlBnFQICkvFEYAeDYre3MxjkBJX88bw=; b=XByOCaEvALnIHGSUqyWHKoQ9df
 akBeBzyJaC5k0gzgmLSDRRMuLUvKDZMB9GPCQGC8rHP4aanQSQQRECU4hfvlP23rpFGkM7uMvVbFD
 XwMy/g7i1rQpm2Wle2/jnqrbB3K7zErGKwsm73iRzEVa+5+YC0LLK8kBmxk4PYsM65RQ=;
Received: from 071-094-058-251.res.spectrum.com ([71.94.58.251]
 helo=[192.168.11.36]) by mx1.supremebox.com with esmtpa (Exim 4.92)
 (envelope-from <opensource@jilayne.com>)
 id 1nAykE-0003Sx-Fy; Fri, 21 Jan 2022 18:34:42 +0000
Content-Type: multipart/alternative;
 boundary="------------TNMzHpz4M1xioeH582HBPMG0"
Message-ID: <1dc97c33-1518-cc62-8b27-0588b17d1801@jilayne.com>
Date: Fri, 21 Jan 2022 10:34:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
Content-Language: en-US
To: Richard Fontana <rfontana@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
 <CAC1cPGypAKcAAia4ipgTWNu33HLW=fb0CSroqR=SK-umrOJb-Q@mail.gmail.com>
From: J Lovejoy <opensource@jilayne.com>
In-Reply-To: <CAC1cPGypAKcAAia4ipgTWNu33HLW=fb0CSroqR=SK-umrOJb-Q@mail.gmail.com>
X-Sender-Ident-agJab5osgicCis: opensource@jilayne.com
X-Mailman-Approved-At: Sat, 22 Jan 2022 08:40:28 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------TNMzHpz4M1xioeH582HBPMG0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I just saw this and have not followed the entire thread from the 
beginning, but if you are unsure if a given license text to something on 
the SPDX License List, I highly recommend using the SPDX License-diff 
browser extension / add-on (for Chrome or Firefox) - once you have that, 
you can simply highlight a text in your browser window and it will tell 
you if it matches or how far off it is if not.

If a license is NOT a match to anything on the SPDX License List, please 
submit it to the SPDX legal team here: 
https://tools.spdx.org/app/submit_new_license/ (and preferably then tag 
me in the Github issue, my Github ide is @jlovejoy ) Please make sure to 
include that it's in the LInux kernel and a link to where you found it.

More about requesting a new license be added to the SPDX License List 
can be found here: 
https://github.com/spdx/license-list-XML/blob/master/DOCS/request-new-license.md

Thanks!
Jilayne
SPDX legal team co-lead


On 1/21/22 10:17 AM, Richard Fontana wrote:
> On Fri, Jan 21, 2022 at 6:03 AM Christophe Leroy
> <christophe.leroy@csgroup.eu>  wrote:
>> Several files are missing SPDX license identifiers.
>>
>> Following files are given the following SPDX identifier based on the comments in the top of the file:
>>
>>          include/asm/ibmebus.h:/* SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD */
>   [...]
>>          platforms/pseries/ibmebus.c:// SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD
> "OpenIB BSD" is not a defined SPDX identifier. There is an SPDX
> identifier "Linux-OpenIB"
> https://spdx.org/licenses/Linux-OpenIB.html
> but I believe that is not a match to what's in these files
> (specifically, the wording of the disclaimer), rather I believe what
> you want here is BSD-2-Clause, but you may want to check that.
>
> Richard
>

--------------TNMzHpz4M1xioeH582HBPMG0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="Red Hat Text">I just saw this and have not followed the
      entire thread from the beginning, but if you are unsure if a given
      license text to something on the SPDX License List, I highly
      recommend using the SPDX License-diff browser extension / add-on
      (for Chrome or Firefox) - once you have that, you can simply
      highlight a text in your browser window and it will tell you if it
      matches or how far off it is if not.<br>
      <br>
      If a license is NOT a match to anything on the SPDX License List,
      please submit it to the SPDX legal team here:
      <a class="moz-txt-link-freetext" href="https://tools.spdx.org/app/submit_new_license/">https://tools.spdx.org/app/submit_new_license/</a> (and preferably
      then tag me in the Github issue, my Github ide is @jlovejoy )
      Please make sure to include that it's in the LInux kernel and a
      link to where you found it. <br>
      <br>
      More about requesting a new license be added to the SPDX License
      List can be found here:
<a class="moz-txt-link-freetext" href="https://github.com/spdx/license-list-XML/blob/master/DOCS/request-new-license.md">https://github.com/spdx/license-list-XML/blob/master/DOCS/request-new-license.md</a><br>
      <br>
      Thanks!<br>
      Jilayne<br>
      SPDX legal team co-lead<br>
      <br>
    </font><br>
    <div class="moz-cite-prefix">On 1/21/22 10:17 AM, Richard Fontana
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAC1cPGypAKcAAia4ipgTWNu33HLW=fb0CSroqR=SK-umrOJb-Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Jan 21, 2022 at 6:03 AM Christophe Leroy
<a class="moz-txt-link-rfc2396E" href="mailto:christophe.leroy@csgroup.eu">&lt;christophe.leroy@csgroup.eu&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Several files are missing SPDX license identifiers.

Following files are given the following SPDX identifier based on the comments in the top of the file:

        include/asm/ibmebus.h:/* SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap=""> [...]
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">        platforms/pseries/ibmebus.c:// SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
"OpenIB BSD" is not a defined SPDX identifier. There is an SPDX
identifier "Linux-OpenIB"
<a class="moz-txt-link-freetext" href="https://spdx.org/licenses/Linux-OpenIB.html">https://spdx.org/licenses/Linux-OpenIB.html</a>
but I believe that is not a match to what's in these files
(specifically, the wording of the disclaimer), rather I believe what
you want here is BSD-2-Clause, but you may want to check that.

Richard

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------TNMzHpz4M1xioeH582HBPMG0--
