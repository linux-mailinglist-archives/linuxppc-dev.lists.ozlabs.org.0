Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC075C5C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 13:19:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZkemUooe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6nBG4rbLz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 21:19:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZkemUooe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6n9N1mP8z2yDQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 21:18:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 36C2361A7B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 11:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE59FC433C7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689938290;
	bh=+1pRznIJZVGaXfyHrneWrC6bYAtsOlit/tS0KrtG2yM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZkemUooeRUEBMXoT+eZuwXtiItz8nm/fDLuhMM6XoA0+EU916wGv+BgIRm9/xgMuX
	 SHioymbBApSyxanIRzsRJlh1H1xIrmrEecxMCb2eiIpMa2MDza+a4Lq7s8MEmglIDe
	 ez4c8dEMJ4yU8fNNE27hJRQDS67tU5s8hkkkchIZQ2TJUr2H0Pp5kPNTLBrZ7BE1tE
	 XtM4lvoh9Le7pYU5tDl1ZWsi1wmd04lf2V4ROGk/Ku3L6+VkMgVjYdls3FN1H/kiR2
	 xtTShhij+hbZh33BcJIHIG5mmO1W021HSeM9yzvPFkgCtgYQYflWAvK86K6XkJEDCq
	 e88ULpSvyQglQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fb41682472so2899820e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 04:18:10 -0700 (PDT)
X-Gm-Message-State: ABy/qLZAP4YEZmGia1OK7Skr2C2IpLPE+29r2V570exeXdUlw1ZjYTK5
	55Kbz7vgskvzs86YT0tp9yFsPbdfeHhyFlpcF50=
X-Google-Smtp-Source: APBJJlGgzNV4bS4ZImEmRoMMfW0jhmUui+8qThAJBRzr+dpV1Qj1REJCRGaubl5KmDySuU4gh04KMBTQZciuHQWvik4=
X-Received: by 2002:a05:6512:6d4:b0:4f9:58ed:7bba with SMTP id
 u20-20020a05651206d400b004f958ed7bbamr1221034lff.16.1689938288556; Fri, 21
 Jul 2023 04:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230718125847.3869700-1-ardb@kernel.org> <20230718125847.3869700-21-ardb@kernel.org>
 <ZLpoDumeF/+xax/V@corigine.com>
In-Reply-To: <ZLpoDumeF/+xax/V@corigine.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 21 Jul 2023 13:17:57 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE4BFjracdzsM87Kq40t683RnT4VXEZjU0d0gRVwso=vA@mail.gmail.com>
Message-ID: <CAMj1kXE4BFjracdzsM87Kq40t683RnT4VXEZjU0d0gRVwso=vA@mail.gmail.com>
Subject: Re: [RFC PATCH 20/21] crypto: deflate - implement acomp API directly
To: Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>, qat-linux@intel.com, Eric Biggers <ebiggers@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>, linux-block@vger.kernel.org, Nick Terrell <terrelln@fb.com>, Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 21 Jul 2023 at 13:12, Simon Horman <simon.horman@corigine.com> wrote:
>
> On Tue, Jul 18, 2023 at 02:58:46PM +0200, Ard Biesheuvel wrote:
>
> ...
>
> > -static int deflate_comp_init(struct deflate_ctx *ctx)
> > +static int deflate_process(struct acomp_req *req, struct z_stream_s *stream,
> > +                        int (*process)(struct z_stream_s *, int))
> >  {
> > -     int ret = 0;
> > -     struct z_stream_s *stream = &ctx->comp_stream;
> > +     unsigned int slen = req->slen;
> > +     unsigned int dlen = req->dlen;
> > +     struct scatter_walk src, dst;
> > +     unsigned int scur, dcur;
> > +     int ret;
> >
> > -     stream->workspace = vzalloc(zlib_deflate_workspacesize(
> > -                             -DEFLATE_DEF_WINBITS, DEFLATE_DEF_MEMLEVEL));
> > -     if (!stream->workspace) {
> > -             ret = -ENOMEM;
> > -             goto out;
> > -     }
> > +     stream->avail_in = stream->avail_out = 0;
> > +
> > +     scatterwalk_start(&src, req->src);
> > +     scatterwalk_start(&dst, req->dst);
> > +
> > +     scur = dcur = 0;
> > +
> > +     do {
> > +             if (stream->avail_in == 0) {
> > +                     if (scur) {
> > +                             slen -= scur;
> > +
> > +                             scatterwalk_unmap(stream->next_in - scur);
> > +                             scatterwalk_advance(&src, scur);
> > +                             scatterwalk_done(&src, 0, slen);
> > +                     }
> > +
> > +                     scur = scatterwalk_clamp(&src, slen);
> > +                     if (scur) {
> > +                             stream->next_in = scatterwalk_map(&src);
> > +                             stream->avail_in = scur;
> > +                     }
> > +             }
> > +
> > +             if (stream->avail_out == 0) {
> > +                     if (dcur) {
> > +                             dlen -= dcur;
> > +
> > +                             scatterwalk_unmap(stream->next_out - dcur);
> > +                             scatterwalk_advance(&dst, dcur);
> > +                             scatterwalk_done(&dst, 1, dlen);
> > +                     }
> > +
> > +                     dcur = scatterwalk_clamp(&dst, dlen);
> > +                     if (!dcur)
> > +                             break;
>
> Hi Ard,
>
> I'm unsure if this can happen. But if this break occurs in the first
> iteration of this do loop, then ret will be used uninitialised below.
>
> Smatch noticed this.
>

Thanks.

This should not happen - it would mean req->dlen == 0, which is
rejected before this function is even called.

Whether or not it might ever happen in practice is a different matter,
of course, so I should probably initialize 'ret' to something sane.



> > +
> > +                     stream->next_out = scatterwalk_map(&dst);
> > +                     stream->avail_out = dcur;
> > +             }
> > +
> > +             ret = process(stream, (slen == scur) ? Z_FINISH : Z_SYNC_FLUSH);
> > +     } while (ret == Z_OK);
> > +
> > +     if (scur)
> > +             scatterwalk_unmap(stream->next_in - scur);
> > +     if (dcur)
> > +             scatterwalk_unmap(stream->next_out - dcur);
> > +
> > +     if (ret != Z_STREAM_END)
> > +             return -EINVAL;
> > +
> > +     req->dlen = stream->total_out;
> > +     return 0;
> > +}
>
> ...
