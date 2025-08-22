Return-Path: <linuxppc-dev+bounces-11218-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE39B320C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 18:51:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7mRW5Y6Qz3cmC;
	Sat, 23 Aug 2025 02:51:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755881479;
	cv=none; b=Vtbito8tYt11TmBllPrsm31lEC5vhC/bQuHUe/2cklFSeCEIkc5KnQy/n1QpnuQeCE/Zkt5fvLxC+LRaK1HiwJXlRdMGQWwM1NYozcWTl5KGCM7D8kjPOKfDwvJErr8SM1MSyAI0VSUO5aGn8bFfi6M1EG/J+OIaHBVf9vdLAzwUZw2Xubg6F+VOIcAbCf6MPUggQHzjdSaeXmgK0Du+fNKtnBTzDR0XzCeQZWD/xYIoGOluBlP99cqt7CVF889NmmK2Xr6mroSX0CLaug4/q9p1QXTHn2sNSBRpO/wGY1AVLmA0Gfwl7c9EZPc1wxg8uj1jieJZgvioq6sYnrwenw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755881479; c=relaxed/relaxed;
	bh=rSrq6tb+AIU0a7vzdc7VjAp0Kh8Za1N9LNjuvBImSjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cVT9LP25rgZ9zSCI8SqF1WG5/BgAAfSpqfepX9oAGvWfCaAy118dtSQRqqfo7nXqAQc1GSH+t06jV490NQuFR2X70lPPEtUL0wQA7ZGdIiwLQHE+kV+X525NpmeDq0t8W2YNLLUh26fiXsjpvyPQChO16OT06u2zWysO3yBl8MGlF0N93EuuVJoQRZmzLh8Qw6UzqcjEsEtOYdTHOZGOJArOZ+povNbRY16RVT+9xNP+PlDsp4pWLA9WX8dlK225wXW1PIiGp9IX/Rdi0c3UGy3HCBJS18OmGKydeaLUJkN3f4mMPPspb6pennJLCMEc0nSNHDNc7CPuKv4npVBK7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TOldZ6P4; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TOldZ6P4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7mRV4hZJz3clh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 02:51:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C70A601E7;
	Fri, 22 Aug 2025 16:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68FDC4CEED;
	Fri, 22 Aug 2025 16:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755881475;
	bh=ZN1/GSSsUnr11TA2ChLgQXw36yoz98xor8JyYYUMooQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TOldZ6P4XjDi8geWUHI4dDlTT6CJl79l8sxl1DywRr/cP9kB878+0JkMA/VKU4RXH
	 0/0bkecaXvUt55YZXuEbcOHw0QQEAL1sp9aA5eSUXoQNTKa+vwliCqVYL132XwqGYX
	 jOyAVQR7WyYfW21GVtx8cGUCtlMYTOf2rrGtTRMmP3JH/EUTBqXjGU16IcKqKz7gzU
	 ii4KkNruWP1ZjXjkv4hjXC3g1ALdUqATnnaexhDPwrJkflTfRAVA//GsLljIjaCxjq
	 C5TibyaJM2cpWRRjFBbRv2JHLBft3EPEvwjfn3TexdNBE3CTT4r1jCt/Xf9RETQSvX
	 CWUdvouXz1saw==
Date: Fri, 22 Aug 2025 11:51:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: "Carlis, Matthew" <mattc@purestorage.com>,
	"Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>,
	"Preble, Adam C" <adam.c.preble@intel.com>,
	"Schofield, Alison" <alison.schofield@intel.com>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"bp@alien8.de" <bp@alien8.de>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"Williams, Dan J" <dan.j.williams@intel.com>,
	"Jiang, Dave" <dave.jiang@intel.com>,
	"dave@stgolabs.net" <dave@stgolabs.net>,
	"erwin.tsaur@intel.com" <erwin.tsaur@intel.com>,
	"Wanyan, Feiting" <feiting.wanyan@intel.com>,
	"Weiny, Ira" <ira.weiny@intel.com>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"lenb@kernel.org" <lenb@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"lukas@wunner.de" <lukas@wunner.de>,
	"mahesh@linux.ibm.com" <mahesh@linux.ibm.com>,
	"oohall@gmail.com" <oohall@gmail.com>,
	"qingshun.wang@linux.intel.com" <qingshun.wang@linux.intel.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"rrichter@amd.com" <rrichter@amd.com>,
	"Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>,
	"Luck, Tony" <tony.luck@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Wang, Yudong" <yudong.wang@intel.com>,
	"Saggi, Meeta" <msaggi@purestorage.com>,
	"sconnor@purestorage.com" <sconnor@purestorage.com>,
	"Karkare, Ashish" <ashishk@purestorage.com>,
	"rhan@purestorage.com" <rhan@purestorage.com>,
	"Rangi, Jasjeet" <jrangi@purestorage.com>,
	"Govindjee, Arjun" <agovindjee@purestorage.com>,
	"Amstadt, Bob" <bamstadt@purestorage.com>
Subject: Re: [PATCH v5 0/2] PCI/AER: Handle Advisory Non-Fatal error
Message-ID: <20250822165112.GA688464@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA3PR11MB9136FCB8C778B0AE08BF8DB5923DA@IA3PR11MB9136.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 22, 2025 at 01:45:30AM +0000, Duan, Zhenzhong wrote:
> Hi Matthew,
> 
> Feel free to take it over if you are interested. Maintainer didn't
> respond to this series, perhaps he expects some improvement in the
> series.

I'm terribly sorry, this is my fault.  It just fell off my list for no
good reason.  Matthew, if you are able to test and/or provide a
Reviewed-by, that would be the best thing you can do to move this
forward (although neither is actually necessary).

Bjorn

> >-----Original Message-----
> >From: Matthew W Carlis <mattc@purestorage.com>
> >Subject: [PATCH v5 0/2] PCI/AER: Handle Advisory Non-Fatal error
> >
> >Hello. My team had independently started to make a change similar to this
> >before realizing that someone had already taken a stab at it. It is highly
> >desirable in my mind to have an improved handling of Advisory Errors in
> >the upstream kernel. Is there anything we can do to help move this effort
> >along? Perhaps testing? We have a decent variety of system configurations &
> >are able to inject various kinds of errors via special devices/commands etc.
> >
> >Thanks,
> >-Matt

