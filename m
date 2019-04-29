Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF4E466
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 16:14:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t68m50jLzDq8v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 00:14:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=metux.net
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t66V5FgtzDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 00:12:00 +1000 (AEST)
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N9d4t-1ggOYm2XMj-015Xti; Mon, 29 Apr 2019 16:11:21 +0200
Subject: Re: [PATCH 01/41] drivers: tty: serial: dz: use dev_err() instead of
 printk()
To: Greg KH <gregkh@linuxfoundation.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-2-git-send-email-info@metux.net>
 <20190427132959.GA11368@kroah.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <e10175d0-bc3b-a4ab-cb47-0b4761bfb629@metux.net>
Date: Mon, 29 Apr 2019 16:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190427132959.GA11368@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:w68pyQn6kRKE7GRI8D4DIjXrIG1rM4JVO8YNhN1PjmA9qeJlTnd
 FRfk7wZg3723UrBQe25rwfOnwSzGszEb1MIoCQQLNzhyCTgLVqEInQLMVDSZ6SrfQMpGeUD
 sSICNMoMdNK6YaqchK3BXnaBaPE/dmfwd/DCv3Rgt3Peb9t9zVGwhF+PiwHnSknkczZ5jwA
 iaTSwPj+i6uzJ5jOg0EOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GSBkrDSKESA=:2lO9/amCuq6fFF597Ih05m
 lHF5oKmclj72Zzkyd/7n7OIiwaRhSBo7oYOd2+ffp/NEUvN2Jn/raFhf0e6E8K+EU2aJRWYj6
 xPazKtRy6+71hDxb8N8/muna5/ompU5XUHAHWvNiNsi3xQSwdRdyVk8toFHaLpavPormaaAC5
 x6cZ0/wtOs54z6LsUIHciLayFiB+BmZ83+sLMyUYXe0KBI/zPixrZD+tu0VcsfcS7r7VYQj4/
 JjNFl9B8X8o/Sjh9uG6Y3vBTGv49VcPY/5tQwUnsC39CoM168B+bxUNpEQ5zA3Jhrk95A+B1n
 6nETxBNJQ3EbF6WPXuX4E75BpNeVCeXQKfLnBOd3nrSBkj/uFH76O1vrWS4AgsfOTt4MHiI62
 WKvPVRgqATCb3N2+oJ8px9tLb4lTxX6XUOOyI503AcT66SDfLFH39tMUPPkDqizBhpx9VxXp2
 FfZsnVaVxHhAOPNsBpVjuzon/QzxCbElmVdBDB7ooHtQ3iaspczt+e5dMm0V3iq1okxyFRY5F
 F/WoUUpE4JmdzZv6STWYNcXwQiTMhpJKgYW0+6X2Vmh2qw16Aiuqtn+H6LLyYHl3ToJgVosT6
 IXgBwLjn12BZ5AjiiM6dfeDhbcZqWNCFedbIreNfGBORb11xOTrYSFbUOSyh0j1BEZIcGO+gz
 XzZByfB5wMLlxYXWanXG9Wg07pbtgY6qOVP/x1S66+XQvoODts6tl2AdS2HQ7qtZOiBu6Jcml
 CvF1VoxkjSF83yH+uX/lseAL7VLzTmM1k9ETeNvnTFIEjvXYr5L640CRVkc=
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
Cc: linux-ia64@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 khilman@baylibre.com, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 sparclinux@vger.kernel.org, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27.04.19 15:29, Greg KH wrote:
> On Sat, Apr 27, 2019 at 02:51:42PM +0200, Enrico Weigelt, metux IT consult wrote:
>> Using dev_err() instead of printk() for more consistent output.
>> (prints device name, etc).
>>
>> Signed-off-by: Enrico Weigelt <info@metux.net>
> 
> Your "From:" line does not match the signed-off-by line, so I can't take
> any of these if I wanted to :(

Grmpf. I've manually changed it, as you isisted in having my company
name remove from it ....

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
