Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7F869ACB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 16:43:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=rDZztf+E;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Sy6F6rzy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkhbh3wW2z3dVB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 02:43:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=rDZztf+E;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Sy6F6rzy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.140; helo=flow5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkhZz5ZQzz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 02:43:07 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id F2D5720008F;
	Tue, 27 Feb 2024 10:43:03 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 10:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1709048583;
	 x=1709055783; bh=rCK/UfqbDu4ldnegzmSK0UKvclJAYdVrTkCZN4NB1xI=; b=
	rDZztf+EZEmbYIIZ7K/BZsGWztOvaw0wL+R1NkEaGPDWSws5dUN+RIpfm1kT9ymI
	ows+zMsmMVnXCAO8Pzidm6a++lXC/Ten//T66Ew2JODUoNckYQNa9HTdBG8kKzyf
	Suej1YRfWtmbrV1ZODw4orTErVizwvwJmRcOC7CWmQVrBkqwrKRbDsUHJZYoDIze
	XKPwfs+Fh03PV0sivL4vKav0n4NzCW4fuNNRtiZf6cUtds9qey1Xef4aEXJwkba8
	xLl6wEAa488pjmfGf8D1AN6iPSngdkkfhqwWz2TCBv+rzUkVoby7hEYUXTLfmyS8
	SsjkHFi66V+ZqoeoMFeVyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709048583; x=
	1709055783; bh=rCK/UfqbDu4ldnegzmSK0UKvclJAYdVrTkCZN4NB1xI=; b=S
	y6F6rzybn9EGdSOYXZNXjq9Jc08BcyWDVLk5vtfltqR/0N3QejLBvtuH1nM61fB/
	IpxgH5KgpJ/goepKpnHxdwuGRVsuDrcCX1H4gPQWgRJoNbFmpcyfCmoyZeAIT+Px
	e2jmbnjPrwHxEK7UsLFt/0pzARlBBj2xO1hKShLE3owgixW9wRybOa7Jmi+zD7/5
	wrgeY6P3WATH6wneKFBpQ59A1ZEeGzGbkNFXebbVdc5nkEAO/2kPx47NpcIHD1sz
	r1UEtZnsz/CRAFLkaE9NR5PTmwRoxMZTi7HCro+oB8aZqqOydQ+HgAQtqRiN5Wr+
	+g2GTOK/SO4LXnM3FOlvw==
X-ME-Sender: <xms:BwPeZS47SiblYbq7KodBAl_Vc4Q9Y5qZlFxO6xcw7TfMbjq8SYvnPg>
    <xme:BwPeZb6iJLmH3mKw8HMCI9wL5vjkcISz55DV2rBlEfop_Dhd351GNWpdWcaduCc_F
    4h6LT4oizGD01noD2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:BwPeZRdXWIE5kOTCERrtcwBtgdmrzQx7Zxk1nJMXDnP15whFzvolnw>
    <xmx:BwPeZfIq8_C9BA8eTIRSxwKMtaC4-DCaunMnbd1Z7sOfTzTyzfNmJA>
    <xmx:BwPeZWJ5er8j5CGFNjxyS-0pKZukwg0k31oFVMfRzmxPIG9heixJsw>
    <xmx:BwPeZcVl_5_jsCSftcKQxQLVmz2VxDWr5GmFcuI1KfH_6G4hprdKi3j4jWg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 897ACB6008D; Tue, 27 Feb 2024 10:43:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <e49232e2-9fa9-4f83-9471-a3852b83c113@app.fastmail.com>
In-Reply-To: <9aae81d0-dfaf-423c-8ceb-72829a98420d@csgroup.eu>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
 <9aae81d0-dfaf-423c-8ceb-72829a98420d@csgroup.eu>
Date: Tue, 27 Feb 2024 16:42:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "x86@kernel.org" <x86@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Jan Kiszka <jan.kiszka@siemens.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, "linux-snps-arc@lists.infradead.org" <linu
 x-snps-arc@lists.infradead.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Kieran Bingham <kbingham@kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024, at 20:02, Christophe Leroy wrote:
> Le 26/02/2024 =C3=A0 17:14, Arnd Bergmann a =C3=A9crit=C2=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>
> That's a nice re-factor.
>
> The only drawback I see is that we are loosing several interesting=20
> arch-specific comments/help text. Don't know if there could be an easy=20
> way to keep them.

This is what I have now, trying to write it as generic as
possible while still giving useful advice:

config PAGE_SIZE_4KB
        bool "4KiB pages"
        depends on HAVE_PAGE_SIZE_4KB
        help
          This option select the standard 4KiB Linux page size and the o=
nly
          available option on many architectures. Using 4KiB page size w=
ill
          minimize memory consumption and is therefore recommended for l=
ow
          memory systems.
          Some software that is written for x86 systems makes incorrect
          assumptions about the page size and only runs on 4KiB pages.

config PAGE_SIZE_8KB
        bool "8KiB pages"
        depends on HAVE_PAGE_SIZE_8KB
        help
          This option is the only supported page size on a few older
          processors, and can be slightly faster than 4KiB pages.

config PAGE_SIZE_16KB
        bool "16KiB pages"
        depends on HAVE_PAGE_SIZE_16KB
        help
          This option is usually a good compromise between memory
          consumption and performance for typical desktop and server
          workloads, often saving a level of page table lookups compared
          to 4KB pages as well as reducing TLB pressure and overhead of
          per-page operations in the kernel at the expense of a larger
          page cache.

config PAGE_SIZE_32KB
        bool "32KiB pages"
        depends on HAVE_PAGE_SIZE_32KB
          Using 32KiB page size will result in slightly higher performan=
ce
          kernel at the price of higher memory consumption compared to
          16KiB pages.  This option is available only on cnMIPS cores.
          Note that you will need a suitable Linux distribution to
          support this.

config PAGE_SIZE_64KB
        bool "64KiB pages"
        depends on HAVE_PAGE_SIZE_64KB
          Using 64KiB page size will result in slightly higher performan=
ce
          kernel at the price of much higher memory consumption compared=
 to
          4KiB or 16KiB pages.
          This is not suitable for general-purpose workloads but the
          better performance may be worth the cost for certain types of
          supercomputing or database applications that work mostly with
          large in-memory data rather than small files.

config PAGE_SIZE_256KB
        bool "256KiB pages"
        depends on HAVE_PAGE_SIZE_256KB
        help
          256KB pages have little practical value due to their extreme
          memory usage.

Let me know if you think some of this should be adapted further.

>>  =20
>> +#define PAGE_SHIFT CONFIG_PAGE_SHIFT
>>   #define PAGE_SIZE  (1UL << PAGE_SHIFT)
>>   #define PAGE_MASK  (~((1 << PAGE_SHIFT) - 1))
>>  =20
>
> Could we move PAGE_SIZE and PAGE_MASK in a generic/core header instead=20
> of having it duplicated for each arch ?

Yes, but I'm leaving this for a follow-up series, since I had
to stop somewhere and there is always room for cleanup up headers
further ;-)

      Arnd
