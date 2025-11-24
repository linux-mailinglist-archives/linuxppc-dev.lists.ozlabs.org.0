Return-Path: <linuxppc-dev+bounces-14438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA73C7FB77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 10:49:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFLdh1Yypz2yvN;
	Mon, 24 Nov 2025 20:49:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763977784;
	cv=none; b=XxZa2T4zrFZiRS8ctP2YMhH86md3lEMi86PsZwZlbCFVtguQTEkg1fkA/Z6FW4A2TygY3lu30VgUHCgowYlNt8Mq1Qi5OYD6WGIu4I2aCzDKrh124kgqeu+fvPzdzZr0pU5pHtY6i+Rok0dy1wrj2M1s/m6m7/IxdYI0XGQybNpK+DSqQTe11nUFiLBhan9tqobx9f/B3wLiApt5t/ugZKqoOR6986NFrxQVTUkdBalDsVO7mzTysc9kYmwJw3YuBnrveRs8Y1BkBmMk7WgPPVkBQGbXswyjeE/i2rtqLUCGubciS42hS53qRfgE24m03KLdOFvj1r4z1EXXg7O42w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763977784; c=relaxed/relaxed;
	bh=EQlPnJOgeGPuWMWnsDhrIkMYd+HWd8AP9Hh0CoTN7EI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANbnC9kJY9CQfUm0/OKuF3CVlnW4f5V6TaTEmRrzLIfFvVRAmX3r4WwJH1fIL1I+T248w0LTmt8E5Y2EJTzWnZhgDMMXQK8vBNeZubIRxgvzg2jaJZzxw8fKB33E41GKjFS+DdLI/nTulyJ7cOmH2lL5kZsFRvjcbDp74Du/w06Ahox36hYcisrT3orTrRIynUfEsWthdYiiYUDI/wJeyVSYz95J+Su34G3J+sN8SYSjtTkmhnUHLOa/lg9643j07HVxQFZNlzWQWcMHjnTNWBa7/kbzoFaiQVY/12MmhXu7gp2fNqLFSoMJ604apGYC7IKyy51QqGktp+pTb11NMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=U58iFAJL; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=U58iFAJL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 451 seconds by postgrey-1.37 at boromir; Mon, 24 Nov 2025 20:49:42 AEDT
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFLdf4DMTz2xQq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 20:49:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1763977313;
	bh=ggo0FIh6yZF0vZdd1wccMpu7GQYzL53JaLhCrTFUHSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U58iFAJLixclCXqRuNo0HJp1vUKu08nuKIB/G0v66x/wLz2rOHOAdU7iWZmANdZ0L
	 OxN1WL/KFOB3VA2k+WEf+wGRZ0ObkZhP2BdZqKFF9GbzjB+opzoU/Ep9EEw+75oCNx
	 En12qDqZaV2WgkqGfVMzxnf7Jo6mqaQMTEmZwMho=
Date: Mon, 24 Nov 2025 10:41:52 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, 
	kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>, 
	=?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3 0/9] module: Introduce hash-based integrity checking
Message-ID: <a8802164-60c0-441f-973a-5fda415caff7@t-8ch.de>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <f1dca9daa01d0d2432c12ecabede3fa1389b1d29.camel@HansenPartnership.com>
 <20251119154834.A-tQsLzh@linutronix.de>
 <20251123170502.Ai5Ig66Z@breakpoint.cc>
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
In-Reply-To: <20251123170502.Ai5Ig66Z@breakpoint.cc>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sebastian,

On 2025-11-23 18:05:02+0100, Sebastian Andrzej Siewior wrote:
> On 2025-11-19 16:48:34 [+0100], Sebastian Andrzej Siewior wrote:
> > I fully agree with this approach. I don't like the big hash array but I
> > have an idea how to optimize that part. So I don't see a problem in the
> > long term.
> 
> The following PoC creates a merkle tree from a set files ending with .ko
> within the specified directory. It will write a .hash files containing
> the required hash for each file for its validation. The root hash is
> saved as "hash_root" and "hash_root.h" in the directory.

Thanks a lot!

> The Debian kernel shipps 4256 modules:
> 
> | $ time ./compute_hashes mods_deb
> | Files 4256 levels: 13 root hash: 97f8f439d63938ed74f48ec46dbd75c2b5e5b49f012a414e89b6f0e0f06efe84
> | 
> | real    0m0,732s
> | user    0m0,304s
> | sys     0m0,427s
> 
> This computes the hashes for all the modules it found in the mods_deb
> folder.
> The kernel needs the root hash (for sha256 32 bytes) and the depth of
> the tree (4 bytes). That are 36 bytes regardless of the number of
> modules that are built.
> In this case, the attached hash for each module is 420 bytes. This is 4
> bytes (position in the tree) + 13 (depth) * 32.
> The verification process requires 13 hash operation to hash through the
> tree and verify against the root hash.

We'll need to store the proof together with the modules somewhere.
Regular module signatures are stored as PKCS#7 and appended to the module
file. If we can also encode the merkle proof as PKCS#7, the integration
into the existing infrastructure should be much easier.
It will require some changes to this series, but honestly the Merkle
tree aproach looks like the clear winner here.

> For convience, the following PoC can also be found at
> 	https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/mtree-hashed-mods.git/
> 
> which also includes a small testsuite.

(...)


Thomas

