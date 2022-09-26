Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9A5EB501
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 01:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbywv4y6dz3bmC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 09:03:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=UqjtJ9GU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cisco.com (client-ip=173.37.142.93; helo=alln-iport-6.cisco.com; envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=UqjtJ9GU;
	dkim-atps=neutral
X-Greylist: delayed 123 seconds by postgrey-1.36 at boromir; Tue, 27 Sep 2022 09:03:04 AEST
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbyw873Kqz3bWD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 09:03:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=772; q=dns/txt; s=iport;
  t=1664233385; x=1665442985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9lF1v7Ra0dl1OC5suIbwGZInJITE1VNb8U5AxddwgW8=;
  b=UqjtJ9GUZx3dnb89USGlEKVRD03rCobm+lVI4eLY3qidg1Pgx1vE6HSj
   i0VtT7i6WnMeUXdGlO6HkRDbojK/ToqzHZwbxCx5b9fkP0KN6GXv6f5yT
   VzSsbpn7TRCXOf4JHLsXOz1qDk9gQb7oLEK0vi5wxVX26PoVsQBU+mfSy
   U=;
X-IPAS-Result: =?us-ascii?q?A0AQAAAJLjJjmJldJa1aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?TsHAQELAYMkVT5FjG2GUIIokWiLKoF8CwEBAQ0BATkJBAEBgVODMgKEbAIlN?=
 =?us-ascii?q?AkOAQIEAQEBAQMCAwEBAQEBAQMBAQUBAQECAQcEFAEBAQEBAQEBHRkFEA4nh?=
 =?us-ascii?q?WgNhkMBAgM6PxALGC5XBhOCfQGDIAMQqXh4gTSBAYNQARgYhByBXwYkgRkBk?=
 =?us-ascii?q?CgnHIFJRIQ/PohSgi4EmSU4A0QdQQMLQjUYAxQDBSQHAxkPIw0NBBYHDAMDB?=
 =?us-ascii?q?SUDAgIbBwICAwIGEwUCAk02CAQIBCskDwUCBy8FBC8CHgQFBhEIAhYCBgQEB?=
 =?us-ascii?q?AQVAhAIAggmFwcTMxkBBVkQCSEcDhoNBQYTAyBvBUQPKDFrKx0bCoEMKigVA?=
 =?us-ascii?q?wQEAwIGEwMDIgIQKjEUBCkTEi0HK3MJAgMiZwUDAwQoLAMJIR8HKCY8B1g6A?=
 =?us-ascii?q?QQDAhAiPQYDCQMCJFuBLygFAw0ZJggFIxceBAg8AgUGVxMCChIDEw+YZYILg?=
 =?us-ascii?q?UF7gUKTC4JkjT+BMJ0vg2OBSYlylGJMEahzlwuNPJoEAgQGBQIWgWE6gVszG?=
 =?us-ascii?q?ggbFYMjEj4ZD445iG2FaiQzOQIGCwEBAwmKUAEB?=
IronPort-Data: A9a23:QOxF9qLwIuFJr1KtFE+RIJIlxSXFcZb7ZxGr2PjKsXjdYENS1GEAn
 WAWUWGEOPbbYGv9LYpyYYjk9UMBuZPRzN5lTAUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcIZsCCW0Si6FatANl1EkvU2zbue6WbWs1hxZH1c+En9w00w7wYbVv6Yx6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eC/5UhN6/zEInqR5fOria4KcbhL
 wrL5OnREmo0ZH7BAPv9+lrwWhVirrI/oWFih1IOM5VOjCSuqQRj9J48G6JAcHwUjm+xvdZ8l
 /NMksGvHFJB0q3kwIzxUjFCGC14eKZB4rKCez60sNeYyAvNdH6EL/dGVR5te9ZHvLcsRzgTr
 pT0KxhVBvyHr+6/xrO2TvZlrs8iN8LseogYvxmMyBmIU618EcmaH/2iCdlw7ilqnMxAHfzlQ
 JQIa2M0MR/kOBNiAwJCYH45tL742iagG9FCk3qRpKwq8y3ewg1ZzrfgKpzWd8aMSMETmVyXz
 krC/mLkElQZPsGezTat7H2hnKnMkDn9VYZUE6e3ntZmjUOSzWEPEhAbfUW0rOP/iUOkXd9bb
 UsO9UIGqak06VzuTdTnWRC8iGCLswRaWNdKFeA+rgaXxcL85wefG3hBRyRELd8rrsk7QRQu1
 0SVhJXoAzJ1ubGYQH7b8a2bxRuyISE9P34eYjVCRgwAi/HnoYcungrXRZNvHbCditzuBSq2x
 CKOpSIlwbIJgqYj06S94ECChjO0vbDXQQMvoAbaRGSo6kV+foHNT5z4t3DY4OxGIYLfSUOO1
 FANmNCbxOQPC4yd0SKKXeMBFa2o4PDDNyfT6XZ1GJMh3zeg4XiuecZX+j4WDExpKMcfZTjxY
 EKVvQ5L4457N2Cld6hqe8S8FqwC0qnkEfzmW+rSY94IZYJ+HCec8ShoI0eW0233i08quboyM
 pDdesGpZV4WAKJmwT6eSOYYybIvyz4/zmOVXpn9ihq92LyVZWWeTvEOOR2TdYgEALisug7Z9
 ZNUMNGHjk8ZW+zlaS6R+okWRbwXEZQlLcHQk8t4LrKaGUljQlkDDfKO57IGJpMwysy5idz01
 n26X0ZZzn/2invGNRiGZxhfhFXHAMsXQZUTYHFEALq455QwSd31vftALfPbaZFipbI8laQrJ
 xUQU5/YasmjXAgr7Nj0gXPVlo1pdB2xiRmJOUJJixBgIsYwHmQlFjIYFzYDGQEUBSax8MA5u
 bDljEXQQIEIQEJpC8O+hBOTI7GZ4Cl1dAFaBhugzjxvlKPEq9ECx8vZ1aRfHi30AU+frgZ2L
 i7PafvimcHDopUu7P7Cjr2eooGiHoNWRxQEQzOCsu7qbHOHogJPJLOsts7VIlgxs0upqM2fi
 Rl9k5kQzdVexg8R6toge1qV5fJmv7MDWIO2Piw9TCmUMDxH+5trI2KN2oFUp7ZRy7pC0TZaq
 WrRkuS2zY6hYZu/eHZIfVJNRr3ahZk8xGKIhdxrexqS2cOC1OfdOamkF0PS2HU1wXocGN5N/
 NrNT+ZNu1bu0kpzb47c5s2WnkzVRkE9v2wcnslyKOfWZsADkDmuvbS05vfK3ayy
IronPort-HdrOrdr: A9a23:XuwFpqoWy0RMTz0rP6Os0rEaV5oueYIsimQD101hICG9vPb2qy
 mLpoV/6faUskdyZJhOo7q90cW7LE80sKQFhbX5Xo3SPzUO2lHIEGgK1+KLqAEIWRefygc378
 ldmsZFZOEZyTNB/KDHCM7SKadG/OW6
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.93,347,1654560000"; 
   d="scan'208";a="963281140"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Sep 2022 22:59:48 +0000
Received: from zorba ([10.25.129.98])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 28QMxjxT030040
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 Sep 2022 22:59:46 GMT
Date: Mon, 26 Sep 2022 15:59:45 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Subject: Re: [PATCH 0/8] generic command line v4
Message-ID: <20220926225945.GC4320@zorba>
References: <20210416040924.2882771-1-danielwa@cisco.com>
 <b517fac5-2fdc-a8c9-75d0-174c67f5a2de@seco.com>
 <20220922205334.GV4320@zorba>
 <dcff9b0f-82c8-5aa7-0fff-b749a05fcb20@seco.com>
 <20220922211026.GW4320@zorba>
 <1663881344.25129.23.camel@chimera>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1663881344.25129.23.camel@chimera>
X-Outbound-SMTP-Client: 10.25.129.98, [10.25.129.98]
X-Outbound-Node: rcdn-core-2.cisco.com
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
Cc: Rob Herring <robh@kernel.org>, linux-efi@vger.kernel.org, devicetree@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 22, 2022 at 02:15:44PM -0700, Daniel Gimpelevich wrote:
> On Thu, 2022-09-22 at 14:10 -0700, Daniel Walker wrote:
> > On Thu, Sep 22, 2022 at 05:03:46PM -0400, Sean Anderson wrote:
> [snip]
> > > As recently as last month, someone's patch to add such support was
> > > rejected for this reason [1].
> > > 
> > > --Sean
> > > 
> > > [1] https://lore.kernel.org/linux-arm-kernel/20220812084613.GA3107@willie-the-truck/
> > 
> > 
> > I had no idea.. Thanks for pointing that out. I guess I will re-submit in that
> > case.
> > 
> > Daniel
> 
> This has been happening repeatedly since circa 2014, on multiple
> architectures. It's quite frustrating, really.
 
 I'm not sure I'm following your comments. What's frustrating exactly ?

Daniel
