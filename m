Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1AC714829
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 12:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVByg2XB4z30NN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 20:46:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kO2I3xZB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2b; helo=mail-yb1-xb2b.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kO2I3xZB;
	dkim-atps=neutral
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVBxp43kYz3dwF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 20:45:16 +1000 (AEST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bacfb7acdb7so4873578276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685357113; x=1687949113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjEDNzZxOop2VOG3TlruQByMALTvalbpgRkYicVySh8=;
        b=kO2I3xZBL5Fe6W44U6h5s0RTzUX1eBWFPWgeyLaB+aRoskBhW8J6xFuenfgi/xR6Wh
         IZRcy/wR/Zus7O3ZAFUC3RVR7HAr4Z3gzYddvxPIHRaxis8PczdXexDsOzSNucW1AIRp
         /3EXL3LfTJKYlHuuqeECSSOTiXyzytVrKZda+frNZ+aiXehejLzWaTlZyBMWCTdVQKOh
         p9+ACmhXzwYD/jXNtnBaaDnk+NV9rGfzojXroEzvf69Bao7ikkBVaSDJ5GdNbHSq1YKU
         D+LokY4GFBGAAmsFvdnP9eOuys0mkxoVRfOqLI2GmGtGeSd/DurcgCqC+JhBjSxOMyJO
         ZEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685357113; x=1687949113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjEDNzZxOop2VOG3TlruQByMALTvalbpgRkYicVySh8=;
        b=GUyxnqkOdMkk6BZ60yOOovkIaoZPy6PxFY0wTNSSkAi119gOPNO22vkU210zLSZqvI
         sTxORnEoRrKiKyLgUoj2CuHAZ22k9Mo9A8oanVufwyB3ZNX+zR9igOn6qKm1ifDB3JUT
         3hpEhLL53YqIOOxPipt+vYjPk6yPj2uPxtyvroIcyhcnqqCB7nS1V0bu8yGs8BpcofFm
         Z+nVGpU95V3HZfkMr22CfOvtiJWyibftvieVSCjBT2U2j8LPCL9evi457boWPk2QXXVW
         X2i73yNEaElXqGIuCidQwYKJShLI6sAkY2rxGsiPYoNipJ0xNnA8V6AiP1W+KD5h0hfc
         kYhA==
X-Gm-Message-State: AC+VfDyiYZBZjbA+iT68IC5zkvgtNwOGa6/BKHBQcdTxCpTryvOtyTTq
	yXVSCFrCnQetFpHFChoQ8RVzYfta4NF7niOBToo=
X-Google-Smtp-Source: ACHHUZ5QdR94nzDQt83x8V/WkILpLluqVkaeIbNyyg/QzdVwVfLHlHihL7XEiUJURDL+vQFPJVUBPDwPjEnUpzLbjCY=
X-Received: by 2002:a0d:df42:0:b0:565:9387:9c61 with SMTP id
 i63-20020a0ddf42000000b0056593879c61mr12169606ywe.7.1685357113318; Mon, 29
 May 2023 03:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230529052832epcas5p4fa1b8cf25d9810d32bd2ccf012086fb3@epcas5p4.samsung.com>
 <20230529052821.58175-1-maninder1.s@samsung.com>
In-Reply-To: <20230529052821.58175-1-maninder1.s@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 May 2023 12:45:02 +0200
Message-ID: <CANiq72ncDr68qeahrHuQ63dj1Va3=Us6ZSjGRkr6Zp8j+=yH_Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] arch:hexagon/powerpc: use KSYM_NAME_LEN in array size
To: Maninder Singh <maninder1.s@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: nathanl@linux.ibm.com, bcain@quicinc.com, keescook@chromium.org, gary@garyguo.net, pmladek@suse.com, ustavoars@kernel.org, linux-kernel@vger.kernel.org, Onkarnath <onkarnath.1@samsung.com>, wedsonaf@google.com, npiggin@gmail.com, alex.gaynor@gmail.com, linux-hexagon@vger.kernel.org, ojeda@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 29, 2023 at 7:44=E2=80=AFAM Maninder Singh <maninder1.s@samsung=
.com> wrote:
>
> kallsyms_lookup which in turn calls for kallsyms_lookup_buildid()
> writes on index "KSYM_NAME_LEN - 1".
>
> Thus array size should be KSYM_NAME_LEN.
>
> for powerpc and hexagon it was defined as "128" directly.
> and commit '61968dbc2d5d' changed define value to 512,
> So both were missed to update with new size.
>
> Fixes: 61968dbc2d5d ("kallsyms: increase maximum kernel symbol length to =
512")
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

Thanks for this!

There is no `From:` at the top. Since I cannot locate the patch in
Lore, did you mean to put both of you as authors perhaps? In that
case, please use a `Co-developed-by` as needed.

Perhaps it is a good idea to submit each arch independently, too.

The changes themselves look fine on a quick inspection, though the
`xmon.c` one is a global buffer (and there is another equally-sized
buffer in `xmon.c` with a hard-coded `128` constant that would be nice
to clarify).

Cheers,
Miguel
