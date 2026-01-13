Return-Path: <linuxppc-dev+bounces-15647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69036D19A50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 15:57:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drC5X4Zytz2xWP;
	Wed, 14 Jan 2026 01:57:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768316240;
	cv=none; b=j0NJBsUcG4ZGEYbktfRoEaR12dqpEhJmkbSdvOXynBD3XRiOjLoSUqlTcyXe/szU5IqPXV1V+zc6AV4wg6PR9klqM6m8XB1+r+CcOwCP3UoEKgQyJ7ajvmr4DznnCl9EyNPfNddETW7FEpd9cJFIBon+vhzgLZm/nzzin7ePjZQ9kugzTx51zKXB78OKaROxETaUFI97qeio/G0FUp/+vOI9/JWz3H4NRWxFLOeBntWYpoeZJlAn4rJfPp8PNpztT3ypWQ31424gLcy/CUp7AodwhSebhiq/6oEibooea9JhluHu7Xd1QEGxbIyvLuS2cBRBDObrnmbxzMRzY40mFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768316240; c=relaxed/relaxed;
	bh=7sfzPEDYda0fB777q3Y+R5qIxdXTsgJj2IRA+hNFGpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BK35JbM77iM3StzTGJ+OOc7bHqx0KkpfXWGh4XvSQYC6FdTOJL/3WsILUfgqXqoP+WXvUDyxk+VARxVFZnqmcAizeetEoVSifOGQ1SiYoipm7Krl+xHsH9jlgousoo0w5ulGgF8l56ERgZc+5ibwMy+CXk38LMGUtP9+JuOcSfvA7gx/pSJXf8AnrZM5h3Ph3WsyHnqGbAI3uehD3o2e7GKZaQdjmB9zRZalKEpqD93wtHfPNnnitdifaSz4JeCBYep1QA2+g/JsG3qukVJ4MZVq1qd7WtNVqxQiURwgQNJX+Pt5IC4WZIfEY5hnnEj3i4Ap/uy4ZMrV2MS5aSotYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sSx4mOU4; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EElHHGGH; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sSx4mOU4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=EElHHGGH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drC5V4R0cz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 01:57:18 +1100 (AEDT)
Date: Tue, 13 Jan 2026 15:56:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768316198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sfzPEDYda0fB777q3Y+R5qIxdXTsgJj2IRA+hNFGpw=;
	b=sSx4mOU4qkDYzkkx/o4BEtWyl3KyxW3euTuarzApOzTpXlaTS++4XY/zozFEdwI+2D4gqc
	X/2YYXHPhJ39OiUekNo9mxCgbd3mRKVP6iJ5LixKaumKVEOue7aHTdj2/SSw9AIA7xysiw
	khwRiBeHIgbbxPJE6nsPK4snz9MXXmwk6QsCaNwglaoU9+6Hv1fw7AOuDtH/SrsWBwtrSs
	Zpm5UWEXMa1w74IQw5HzaMgnRUPa2rwJxDOUlrasiueQFGxKTnhVEfsy49uPFRY/wFDjFK
	OtlrNM9syil5J8J1N2p2o6zWC7xe4RZ5ft3jv1L7pqgXQLYRRkdUm/6V+g4TPg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768316198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7sfzPEDYda0fB777q3Y+R5qIxdXTsgJj2IRA+hNFGpw=;
	b=EElHHGGH26sj8RjZyTS7MzBbQHDhVABCJGxSUKy3ePFAS2cW41IbJqoE/+HSbaCGe4llt6
	VlRf7PDMccGp4EBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
	Arnout Engelen <arnout@bzzt.net>,
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
	Christian Heusel <christian@heusel.eu>,
	=?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 15/17] module: Introduce hash-based integrity checking
Message-ID: <20260113145635.YfSTBhVs@linutronix.de>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
 <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260113-module-hashes-v4-15-0b932db9b56b@weissschuh.net>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2026-01-13 13:28:59 [+0100], Thomas Wei=C3=9Fschuh wrote:
> --- /dev/null
> +++ b/scripts/modules-merkle-tree.c
> @@ -0,0 +1,467 @@
=E2=80=A6
> +static void build_proof(struct mtree *mt, unsigned int n, int fd)
> +{
> +	unsigned char cur[EVP_MAX_MD_SIZE];
> +	unsigned char tmp[EVP_MAX_MD_SIZE];

This and a few other instances below could be optimized to avoid
hashing. I probably forgot to let you know.
-> https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/mtree-hashed-mod=
s.git/commit/?id=3D10b565c123c731da37befe862de13678b7c54877

> +	struct file_entry *fe, *fe_sib;
> +
> +	fe =3D &fh_list[n];
> +
> +	if ((n & 1) =3D=3D 0) {
> +		/* No pair, hash with itself */
> +		if (n + 1 =3D=3D num_files)
> +			fe_sib =3D fe;
> +		else
> +			fe_sib =3D &fh_list[n + 1];
> +	} else {
> +		fe_sib =3D &fh_list[n - 1];
> +	}
> +	/* First comes the node position into the file */
> +	write_be_int(fd, n);
> +
> +	if ((n & 1) =3D=3D 0)
> +		hash_entry(fe->hash, fe_sib->hash, cur);
> +	else
> +		hash_entry(fe_sib->hash, fe->hash, cur);
> +
> +	/* Next is the sibling hash, followed by hashes in the tree */
> +	write_hash(fd, fe_sib->hash);
> +
> +	for (unsigned int i =3D 0; i < mt->levels - 1; i++) {
> +		n >>=3D 1;
> +		if ((n & 1) =3D=3D 0) {
> +			void *h;
> +
> +			/* No pair, hash with itself */
> +			if (n + 1 =3D=3D mt->entries[i])
> +				h =3D cur;
> +			else
> +				h =3D mt->l[i][n + 1].hash;
> +
> +			hash_entry(cur, h, tmp);
> +			write_hash(fd, h);
> +		} else {
> +			hash_entry(mt->l[i][n - 1].hash, cur, tmp);
> +			write_hash(fd, mt->l[i][n - 1].hash);
> +		}
> +		memcpy(cur, tmp, hash_size);
> +	}
> +
> +	 /* After all that, the end hash should match the root hash */
> +	if (memcmp(cur, mt->l[mt->levels - 1][0].hash, hash_size))
> +		errx(1, "hash mismatch");
> +}

Sebastian

