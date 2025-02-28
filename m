Return-Path: <linuxppc-dev+bounces-6577-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B1A4A02A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 18:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4FN51H4Bz3brR;
	Sat,  1 Mar 2025 04:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04::f03c:95ff:fe5e:7468"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740763237;
	cv=none; b=ca0lwN0BNmdhjCBuSFhTpgXQ4bm83ddUmhSHxi4q2Gb+o2ofqonzC8VOBUy+3akOTHb1ZPNk+L75ivQ+S1knb6q7TVS1+SthhJInUEnwffokvF31nqiudo0qRo3YFUxg7hMMp3l7gF/pKcM81POYpjvgcOeDGyfCB6Q7WuSQIE+WTrT7HyOggG0okVp6isesttrZWEV1+NY8mvffqxilQ8Id34enx+apZkZFod7gdpgn0oXtka21P2v50t26JwuteInoWk9ziCX2fwsjvF0kX64MPRDvsn+75wY8ddVXBp6DMq1wgXRvdWGGhLdTtoVDnjHCKYkWRzfOmymfLsPnqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740763237; c=relaxed/relaxed;
	bh=CGQcVRwFuirPyfnGMh5tc+DKMPg4EtRPDaHtIqeTFQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omQbzaQw1ScJ6E6UlKt0QADhLBRKYx28wUYKRTaZ9YLp3c+MBaNnmRVBX1aT6kaOoZshIhZxDIBnrTCv3tHZFO1yakMsh/X2wVw5W3p5im+SCkZB1bvJ93xjGtX20lJO5yFsun/zf2YDtT72oP/MtsG3FR0qCufzVkxAVsZ0rqw3x/pT/Ow5AebCdTkjHyeoePeccvO5zX7gb+T3iYTsuystcwzDY2AZsF4SiTQZP5wfvycW+PuoA5qaofd9jbPP59BE87m4UPu7dMsvEqiChT4VlFUiHTMKf6jBzygQ1aHeSI65hHKyzYXfScIm9AzKxusWlWXLL5FpUlPNxoZraw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OtFwe0hG; dkim-atps=neutral; spf=pass (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OtFwe0hG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04::f03c:95ff:fe5e:7468; helo=tor.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04::f03c:95ff:fe5e:7468])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4FN41Hx6z3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 04:20:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADEDB61FAB;
	Fri, 28 Feb 2025 17:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8553C4CED6;
	Fri, 28 Feb 2025 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740763232;
	bh=lbId641pLt0nD6Sl9SeGqbylnJgYsHkSPQi/Fyz3UyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtFwe0hGUoY/0RJlx+Aq7QYaX7Ay1qEz8ujSJnAtZP/rwKtzm2nbr/jTFAfopNYoP
	 8N1CVQ09kPBRlKGlNsgcFAKpZqm3hpKi8v9d+aheuuCORmLQoV58wnTwZ8uerqPnpe
	 WpppPbhMjCMXs0PkGeDcNy2FEfaG4bH0KUkdMlL1gBaTjm9Hzk2K+TT3+BAX12b6DZ
	 XYmTv3H6ZQPrciBPX2E5wftLHIWpTsJD9Zaua/SWd2ZZEOBIYawjhfj5BSFVvaynL2
	 jJRSCn2k5BEkpTOBQ0fUwajfjq0cQyvOEVJfIkjG8eVuXXvEkJgchTWCLMHSQKWQKr
	 4BiT+Rhj3/fOw==
Date: Fri, 28 Feb 2025 09:20:30 -0800
From: Kees Cook <kees@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [next-20250226]Build Failure
Message-ID: <202502280920.583F8CD5F@keescook>
References: <adbe8dd1-a725-4811-ae7e-76fe770cf096@linux.vnet.ibm.com>
 <20250227123804.5dd71cef@canb.auug.org.au>
 <14193c98-fb30-4ee8-a19a-fe85d1230d74@csgroup.eu>
 <SN6PR02MB4157A0C1B4F85D8A289E5CE9D4CD2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <c68287f7-ad00-46fc-a92e-06e0c9074139@csgroup.eu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c68287f7-ad00-46fc-a92e-06e0c9074139@csgroup.eu>
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_XBL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Feb 27, 2025 at 03:15:35PM +0100, Christophe Leroy wrote:
> 
> 
> Le 27/02/2025 à 15:05, Michael Kelley a écrit :
> > From: Christophe Leroy <christophe.leroy@csgroup.eu> Sent: Thursday, February 27, 2025 2:43 AM
> > > 
> > > Le 27/02/2025 à 02:38, Stephen Rothwell a écrit :
> > > > Hi Venkat,
> > > > 
> > > > CC Kees Cook for advice.  This is a result of the tests added in commit
> > > > 
> > > >     bbeb38b8487a ("string.h: Validate memtostr*()/strtomem*() arguments more carefully")
> > > > 
> > > > from the kspp tree.
> > > > 
> > > > I note that the comment about memtostr() says "Copy a possibly
> > > > non-NUL-term string".
> > > 
> > > Can you tell more about your config and your environment ?
> > > 
> > > I just tested with ppc64_defconfig and ppc64le_defconfig, with gcc 12.4,
> > > gcc 13.2 and gcc 14.2 and didn't get that build error.
> > > 
> > > Christophe
> > 
> > FWIW, I see the same build failures related to __must_be_noncstr()
> > when building natively on x86 and on arm64. In both cases, it's an
> > Ubuntu 20.04 installation with gcc 9.4.0 and binutils 2.34.
> > 
> 
> Looks like I get that problem only with GCC 8.5 and GCC 9.5.
> 
> I don't get it with gcc 10.3 nor 11.3 nor 12.4 nor 13.2 nor 14.2
> I don't get it either with gcc 5.5 or 7.5

I will investigate! Sorry for the trouble.

-- 
Kees Cook

