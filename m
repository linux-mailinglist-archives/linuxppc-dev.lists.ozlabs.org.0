Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6F2AE14A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 22:02:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CW0gF0BP7zDqVs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 08:02:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=90.155.50.34; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVx3b1MXMzDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 05:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Ct6aE0Bm8FKKbzyR0cHse7bKKnoXTwBFYl7S9+AHa7M=; b=RFBBplucvygNQ6kLC7amRs2zQ2
 jtuZiTjE7qGN10yc9ZPOrch35q8ioF7bOSvZrVS3CaHAbmRER2RiMQ05VaJEbNKHvh/5BR0O541V2
 Gca/C1mlMqiRD0ABv+Mep2UJ4C1tdOAmjsGmAFXtgHMbf/ZnmKYTa/b/tE++H7sZr3i6NPxdJiFLc
 zZXogcHmMGNFpI3oq7mSneRkgpFUNihyVjwMuW9UXJ6iN7LW82vA/iOo7qS8rBiRYbxtO9DblFakc
 GUdAR8qdE3T1a6EbsoAshklApxvl/ps5eNoUhe4tNlZDdG1fN96lpd4jIJXkVB/fkaHCdXIfsK4xm
 +2iXQ7/A==;
Received: from [2601:1c0:6280:3f0::662d]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcYES-0001S3-4s; Tue, 10 Nov 2020 18:19:04 +0000
Subject: Re: Duplicated ABI entries - Was: Re: [PATCH v2 20/39] docs: ABI:
 testing: make the files compatible with ReST output
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
References: <cover.1604042072.git.mchehab+huawei@kernel.org>
 <58cf3c2d611e0197fb215652719ebd82ca2658db.1604042072.git.mchehab+huawei@kernel.org>
 <5326488b-4185-9d67-fc09-79b911fbb3b8@st.com>
 <20201030110925.3e09d59e@coco.lan>
 <cb586ea3-b6e6-4e48-2344-2bd641e5323f@st.com>
 <20201102124641.GA881895@kroah.com> <20201102154250.45bee17f@coco.lan>
 <20201108165621.4d0da3f4@archlinux> <20201110082658.2edc1ab5@coco.lan>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aa855d9a-4fc6-2b64-b6b7-69409af3f9d0@infradead.org>
Date: Tue, 10 Nov 2020 10:18:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201110082658.2edc1ab5@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:58:59 +1100
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Petr Mladek <pmladek@suse.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Nayna Jain <nayna@linux.ibm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Sebastian Reichel <sre@kernel.org>,
 linux-mm@kvack.org, Bruno Meneguele <bmeneg@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Hanjun Guo <guohanjun@huawei.com>, Guenter Roeck <groeck@chromium.org>,
 netdev@vger.kernel.org, Oleh Kravchenko <oleg@kaa.org.ua>,
 Dan Williams <dan.j.williams@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 =?UTF-8?Q?Javier_Gonz=c3=a1lez?= <javier@javigon.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>, Mark Gross <mgross@linux.intel.com>,
 linux-acpi@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Tom Rix <trix@redhat.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Len Brown <lenb@kernel.org>, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Oded Gabbay <oded.gabbay@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Dan Murphy <dmurphy@ti.com>,
 Orson Zhai <orsonzhai@gmail.com>, Philippe Bergheaud <felix@linux.ibm.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, Konstantin Khlebnikov <koct9i@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Kranthi Kuntala <kranthi.kuntala@intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Leonid Maksymchuk <leonmaxx@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 Vineela Tummalapalli <vineela.tummalapalli@intel.com>,
 Peter Rosin <peda@axentia.se>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/9/20 11:26 PM, Mauro Carvalho Chehab wrote:
> Hi Jonathan,
> 
> Let's view ABI from the PoV of a system admin that doesn't know
> yet about a certain ABI symbol.
> 
> He'll try to seek for the symbol, more likely using the HTML 
> documentation. Only very senior system admins might try to take
> a look at the Kernel.

FWIW, I think that the likely search methods are $search_engine
and 'grep'.

Have a good few days off.

-- 
~Randy

