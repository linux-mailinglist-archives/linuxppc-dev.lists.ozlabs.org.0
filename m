Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80478DC96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 09:05:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44swf40g3QzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:05:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 501 seconds by postgrey-1.36 at bilbo;
 Mon, 29 Apr 2019 17:03:44 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44swcJ4652zDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 17:03:42 +1000 (AEST)
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mcp3E-1gl7730n7C-00ZzhK; Mon, 29 Apr 2019 08:48:59 +0200
Subject: Re: [PATCH 37/41] drivers: tty: serial: 8250: simplify io resource
 size computation
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-38-git-send-email-info@metux.net>
 <20190428152103.GP9224@smile.fi.intel.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <431b36fe-3071-fcfd-b04e-b4b293e79a80@metux.net>
Date: Mon, 29 Apr 2019 08:48:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190428152103.GP9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:M88UFXLBX4VkHOON6uaOcOnE636KnuLI4S/ApACS+qnAPKvNe1+
 9MFUOX3DMU30BBIWozSwvAEA9pGnmBl6OGeXBQ8Y1viVSeN44w0UCqfu9VYX20rWKj/nkKL
 vlvP3uU93E8RgsPKi9ujRFjje3G/Y2BUL7L9RvbqLvk4fuIny6ic9WkRhGLxllJ4DYLhyIb
 wH0HgSJz+Bi+9teW53wMg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u9OLiV2NxMI=:BNT2iVnuJdRqsN8euG+dfk
 HBjZpowQEKc8i9YEaAcQxfX0Xrnk35mBLrlhMjbBvcWIf5WZw/7Pm+mXx+V1dFKcQsS+Lu50V
 5bDOcGuFUoK/sUzxnglVGAxNs8eJ9kxrro3+a2JKPL8uc9FJYCUawT3mO+0S0UaJf2AYyGPlX
 /RZ/z54sfajEJVzLQIKL43DrXu63xpZI+71dbpqhzetYGBUoiS0lgc+R55/XoJEx0NuZwa1qb
 gyqEc67qLVR7c64zv+cEsyKzpK7p5kQ1ef+Mi2gQjZKfW3G5SRhKrag1npvi8UefJEXx2WAIe
 OPIdSh1mcaBpIWu3d7+EEIk+IIAtYF6XQ6BkXLNNKTpxQDF33pLqxZ9iendOoYitbc6AwiJUN
 wiy5MO11Nitm2hnsUfqRspcZsQCCt4JIwiUbPExEPdzVVcMo48uFkoDgrr7GDDyoX8pyckM28
 MkK0Bi+1nixNSUu+W8rKndzjg67EbLF4o3lnvwH6ty50zq5zWOmNr5vOZjszTiRS13/Edp6bN
 UDTPm2zo80Pc/XYqImCZbth4Cq4qEAv9pGzOSzSmD7J04gFZibzRJ24o31rEosJzCh9i5R+tH
 80VfeRzGC9goSjNumViDsrjloRJmT2RznsEv2u2OF12R/CIy3vu9c6QNKE5aV2WtZ+vDejhvy
 WHPE3F3UBa0p8I2ypg5w6TxYt4pzpsPC/oQwFQATvFes43QSiGFhNZUNDYgz5zpUabRAvZXAD
 zPTghUltcJp2z28xG/BdfqeOQEK9ZaEQwmQFp7zVxyLyemxTX4aSeEkhqfM=
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.04.19 17:21, Andy Shevchenko wrote:

> 
>> +#define SERIAL_RT2880_IOSIZE	0x100
> 
> And why this is in the header file and not in corresponding C one?

hmm, no particular reason, maybe just an old habit to put definitions
into .h files ;-)

I can move it to 8250_of.c if you like me to.



--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
