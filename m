Return-Path: <linuxppc-dev+bounces-6983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC40A5FD6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 18:17:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDDj06bvMz3cBb;
	Fri, 14 Mar 2025 04:17:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741886276;
	cv=none; b=DnqCp9HP4C5ryWF7HSfkdqkpVKB/ax7zmkwrWc4v7C72a2V35Ob80pekiBcKnRORiMNdujmoGdtx9Gg3R9NaKMgW4QmVY7vh7flmMhZUqMn2ZfSDJUABkuwu067AMSZ6OPUGms+gJWkXeBiFX5pY/bnK7NFZ5lhsySnriXSFBb70xWsaGxiqN71ZPMxXBJgn0ZJIwZ0Li6rfWybZkPwDPN30aKsnz3ZK8eEChaxcpfCtnPNR67Huvp4QXbPqhGpJEe1LkRhs0wfAB0dDuX0a2/30FdwrHJF1WEQ/3YeP6rqFSX/i2qPk9tyXaIk4fhq4RNmHNWJP4NcdZjicC9N+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741886276; c=relaxed/relaxed;
	bh=U8WjavXfNYc90Z2oeKj8GrBVTbzxwuLxZ/6gUXS9It8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxmd0LYt4+tClMaVmgV3WBRdfv7w2qLlJjJRa7WVTyjTxYzwQHn7E+jGOHSaZkvf0CoBYPE2p/RWRkOtxDmCyIGfOObDpDzXO1mBsK8/r6xk21HeEt7H54pJlKatSAQ86MWKPvPH5kcvPSdplshA/IO898giSkxHVX75fDUCQ4E43D3KEtlgjowbcSstGJtr/CLNbqORa3prhAaE6CiSGdg6vWknGHxsHVmrZgCE3ZP2PjycK1rAix3UlwwkeQzfRW6mZoMenqzs1K/+fMFCSx4Q+Qg4OnMWVUrcb7nbYAMDEdhICBTi888CvWSqSliAm8QH6KAD76s7nKtPt8Um/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JhTFLr4N; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JhTFLr4N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDDj01gZrz3c98
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 04:17:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D92BFA4570D;
	Thu, 13 Mar 2025 17:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B49C4CEDD;
	Thu, 13 Mar 2025 17:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741886273;
	bh=x0LfkQleJqSHMA533kQRyLGRE1i8J4My1tYGLUMBafM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhTFLr4Ne31b8oAE7DB2okHcYLVlBcnDz2KSrPKq1bfOx08KKvfQUKkz2kqBNLt+0
	 xw3//f+ZmNusDqD2VQBDKVCc3lyNPNEs5As0GOPaIVU1Ah/TZxqftpzBqyXiJ6mGWw
	 VFhByLIf+c59MrlA490XOy0OsI/yo4JLrbIlzCMsFpZ3TCBbX5gDNiLYFncPtZpG3t
	 3Qe9HprMHPXdSpkXMgzk+Q/NGNhxWaNpEmnncCuhAvrKLixU6mFCOyI8uraA/Ad1zg
	 iQv5JxHRFlgGk3ftlAa2yRpOZzP3Ki0G1sjN+LwlMaOTOFRw8vBx25mR/0rs8VIY8+
	 nJFrVge5guncg==
Date: Thu, 13 Mar 2025 10:17:49 -0700
From: Kees Cook <kees@kernel.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-ID: <202503131016.5DCEAEC945@keescook>
References: <20250313114329.284104-1-acarmina@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 11:43:15AM +0000, Alessandro Carminati wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.

Thanks for picking this series back up! I honestly thought this had
already landed. :)

> With CONFIG_KUNIT enabled, image size increase with this series applied is
> approximately 1%. The image size increase (and with it the functionality
> introduced by this series) can be avoided by disabling
> CONFIG_KUNIT_SUPPRESS_BACKTRACE.

Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
very noisy tests much easier to deal with.

-Kees

-- 
Kees Cook

