Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CE546293A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 01:43:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J33P70DsHz3cRg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 11:43:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=GV8Md+4w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl;
 envelope-from=mirq-linux@rere.qmqm.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256
 header.s=1 header.b=GV8Md+4w; dkim-atps=neutral
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2rXm2h6tz2ynV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 03:34:31 +1100 (AEDT)
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J2rXL58g0z9h;
 Mon, 29 Nov 2021 17:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638203665; bh=qlu3mL+FOvVS9aPE/gZoS7KdAdQ/avBctxZ8QxqT38I=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=GV8Md+4wLJhNSJZqrJvdjyVU0DlzlhbpPkGnTNqVApkG+uUQ6A+MoaqEQT9dgrjXq
 q+escBY9SwJTtDVYNHqesyY22ZcfBKeLVi2I4yINeaBpICc3EsCTOMz8/JkEhkxKwH
 5jlUqEb0yuAf8eVUX8cWy9bi6RovdDbzWpM+g8ZdNeFAwiFdkLHHM+FUiQ+x0Dv37t
 bEpCos1VGSJffWt42H8cWp9GNUDKdAgiFLCcBLScmau30GyMgUFylkw6qvpMGUFype
 xiTzGA2klsrhcAXTQoeGJ7H6y00R/3ukWQ3tN7aMIYo31vE1Ni41oAjMZVdXQclWDE
 FhYcDpXStxEZw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Mon, 29 Nov 2021 16:34:07 +0000
From: =?UTF-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
User-Agent: K-9 Mail for Android
In-Reply-To: <20211129063839.GA338729@lapt>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <YaPEfZ0t9UFGwpml@qmqm.qmqm.pl> <20211129063839.GA338729@lapt>
Message-ID: <3CD9ECD8-901E-497B-9AE1-0DDB02346892@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 30 Nov 2021 11:43:13 +1100
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Christoph Lameter <cl@linux.com>, Christoph Hellwig <hch@lst.de>,
 Andi Kleen <ak@linux.intel.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, Viresh Kumar <viresh.kumar@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jens Axboe <axboe@fb.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-crypto@vger.kernel.org,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, Anup Patel <anup.patel@wdc.com>,
 linux-ia64@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Roy Pledge <Roy.Pledge@nxp.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Dennis Zhou <dennis@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 linux-alpha@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 Stephen Boyd <sboyd@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Subbaraya Sundeep <sbhatta@marvell.com>, Will Deacon <will@kernel.org>,
 Sagi Grimberg <sagi@grimberg.me>, linux-csky@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Mark Gross <markgross@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 David Laight <David.Laight@aculab.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Geetha sowjanya <gakula@marvell.com>, Ian Rogers <irogers@google.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Jiri Olsa <jolsa@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Sunil Goutham <sgoutham@marvell.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 linux-s390@vger.kernel.org, Alexey Klimov <aklimov@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Hans de Goede <hdegoede@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Marcin Wojtas <mw@semihalf.com>,
 Vlastimil Babka <vbabka@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jason Wessel <jason.wessel@windriver.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dnia 29 listopada 2021 06:38:39 UTC, Yury Norov <yury=2Enorov@gmail=2Ecom> =
napisa=C5=82/a:
>On Sun, Nov 28, 2021 at 07:03:41PM +0100, mirq-test@rere=2Eqmqm=2Epl wrot=
e:
>> On Sat, Nov 27, 2021 at 07:56:55PM -0800, Yury Norov wrote:
>> > In many cases people use bitmap_weight()-based functions like this:
>> >=20
>> > 	if (num_present_cpus() > 1)
>> > 		do_something();
>> >=20
>> > This may take considerable amount of time on many-cpus machines becau=
se
>> > num_present_cpus() will traverse every word of underlying cpumask
>> > unconditionally=2E
>> >=20
>> > We can significantly improve on it for many real cases if stop traver=
sing
>> > the mask as soon as we count present cpus to any number greater than =
1:
>> >=20
>> > 	if (num_present_cpus_gt(1))
>> > 		do_something();
>> >=20
>> > To implement this idea, the series adds bitmap_weight_{eq,gt,le}
>> > functions together with corresponding wrappers in cpumask and nodemas=
k=2E
>>=20
>> Having slept on it I have more structured thoughts:
>>=20
>> First, I like substituting bitmap_empty/full where possible - I think
>> the change stands on its own, so could be split and sent as is=2E
>
>Ok, I can do it=2E
>
>> I don't like the proposed API very much=2E One problem is that it hides
>> the comparison operator and makes call sites less readable:
>>=20
>> 	bitmap_weight(=2E=2E=2E) > N
>>=20
>> becomes:
>>=20
>> 	bitmap_weight_gt(=2E=2E=2E, N)
>>=20
>> and:
>> 	bitmap_weight(=2E=2E=2E) <=3D N
>>=20
>> becomes:
>>=20
>> 	bitmap_weight_lt(=2E=2E=2E, N+1)
>> or:
>> 	!bitmap_weight_gt(=2E=2E=2E, N)
>>=20
>> I'd rather see something resembling memcmp() API that's known enough
>> to be easier to grasp=2E For above examples:
>>=20
>> 	bitmap_weight_cmp(=2E=2E=2E, N) > 0
>> 	bitmap_weight_cmp(=2E=2E=2E, N) <=3D 0
>> 	=2E=2E=2E
>
>bitmap_weight_cmp() cannot be efficient=2E Consider this example:
>
>bitmap_weight_lt(1000 0000 0000 0000, 1) =3D=3D false
>                 ^
>                 stop here
>
>bitmap_weight_cmp(1000 0000 0000 0000, 1) =3D=3D 0
>                                 ^
>                                 stop here
>
>I agree that '_gt' is less verbose than '>', but the advantage of=20
>'_gt' over '>' is proportional to length of bitmap, and it means
>that this API should exist=2E

Thank you for the example=2E Indeed, for less-than to be efficient here yo=
u would need to replace
 bitmap_weight_cmp(=2E=2E=2E, N) < 0
with
 bitmap_weight_cmp(=2E=2E=2E, N-1) <=3D 0

It would still be more readable, I think=2E

Best Regards
Micha=C5=82 Miros=C5=82aw
