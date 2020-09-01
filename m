Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A925A0F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 23:49:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh11K6MTkzDqY4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 07:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh0zG49k4zDqJT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 07:47:21 +1000 (AEST)
Received: by mail-ot1-f67.google.com with SMTP id e23so2514919otk.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 14:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HtDmdS2o4yWHgA155sIUrMDEsVQmMWq03sAjdZrfpNk=;
 b=YAGTNtgzk1JT0rRIuZVB97JtSCb0RZFduwN1RkCnod0f0BT8TBtGUrUNN+GEqOofzf
 rgDBouEl9KKq4ji7LG3qk0gY0IHrXEIylZZ97Lbl1KmegE25bEG01EM1Snt2O7C47ad4
 MYloh3lv9zgkN64JrKKMaoEvtYya9kMl5UUfgL0o0RXHruNbQK2wSJzpH+dNMJjS0orF
 /q57htUtWokLC2J6pDHjawxEyrcBkJ4fkd2tZJdNCTykNSLiJlNL5P1gQsDltN3hd2uh
 RC8L8zw0bwDyaNL94yj+vC9TupIlzNFhFudoBmwku8OozvX2QQ4VHmInmful5C3FzszS
 J1Tg==
X-Gm-Message-State: AOAM532AbFlXycuOIPTBRe/vkWtI3mJiBD7rw3ePzrq/Ge0OV4GKMVff
 Ix9e/xLV9x4YLWCHLkj1Cs9OIXx55bo=
X-Google-Smtp-Source: ABdhPJxQcCn5AMUxxBqRbce6L2fcuqikuDht0/03kCXDqB23Lo2StWDoZTXMXJXAvzIizzA1u0dLZQ==
X-Received: by 2002:a05:6830:1209:: with SMTP id
 r9mr3059740otp.206.1598996429897; 
 Tue, 01 Sep 2020 14:40:29 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51])
 by smtp.gmail.com with ESMTPSA id o7sm413032otl.63.2020.09.01.14.40.29
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2020 14:40:29 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id a2so1641499otr.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 14:40:29 -0700 (PDT)
X-Received: by 2002:a05:6830:12c3:: with SMTP id
 a3mr3039860otq.74.1598996428949; 
 Tue, 01 Sep 2020 14:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200730125259.GA8948@gondor.apana.org.au>
 <VE1PR04MB6687FB075B9A6A0923F576978F2E0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <20200901015630.GA9065@gondor.apana.org.au>
In-Reply-To: <20200901015630.GA9065@gondor.apana.org.au>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 1 Sep 2020 16:40:16 -0500
X-Gmail-Original-Message-ID: <CADRPPNTt5dCX1pRUp5OenZBuMNJcN+k8jMVmUo5qw5g0VLZ4hQ@mail.gmail.com>
Message-ID: <CADRPPNTt5dCX1pRUp5OenZBuMNJcN+k8jMVmUo5qw5g0VLZ4hQ@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: Remove bogus packed attributes from qman.h
To: Herbert Xu <herbert@gondor.apana.org.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 31, 2020 at 8:57 PM Herbert Xu <herbert@gondor.apana.org.au> wr=
ote:
>
> On Tue, Sep 01, 2020 at 01:50:38AM +0000, Leo Li wrote:
> >
> > Sorry for the late response.  I missed this email previously.
> >
> > These structures are descriptors used by hardware, we cannot have _ANY_=
 padding from the compiler.  The compiled result might be the same with or =
without the __packed attribute for now, but I think keep it there probably =
is safer for dealing with unexpected alignment requirements from the compil=
er in the future.
> >
> > Having conflicting alignment requirements warning might means something=
 is wrong with the structure in certain scenario.  I just tried a ARM64 bui=
ld but didn't see the warnings.  Could you share the warning you got and th=
e build setup?  Thanks.
>
> Just do a COMPILE_TEST build on x86-64:
>
> In file included from ../drivers/crypto/caam/qi.c:12:

Looks like the CAAM driver and dependent QBMAN driver doesn't support
COMPILE_TEST yet.  Are you trying to add the support for it?

I changed the Kconfig to enable the COMPILE_TEST anyway and updated my
toolchain to gcc-10 trying to duplicate the issue.  The issues can
only be reproduced with "W=3D1".

> ../include/soc/fsl/qman.h:259:1: warning: alignment 1 of =E2=80=98struct =
qm_dqrr_entry=E2=80=99 is less than 8 [-Wpacked-not-aligned]
>  } __packed;
>  ^
> ../include/soc/fsl/qman.h:292:2: warning: alignment 1 of =E2=80=98struct =
<anonymous>=E2=80=99 is less than 8 [-Wpacked-not-aligned]
>   } __packed ern;
>   ^

I think this is a valid concern that if the parent structure doesn't
meet certain alignment requirements, the alignment for the
sub-structure cannot be guaranteed.  If we just remove the __packed
attribute from the parent structure, the compiler could try to add
padding in the parent structure to fulfill the alignment requirements
of the sub structure which is not good.  I think the following changes
are a better fix for the warnings:

diff --git a/include/soc/fsl/qman.h b/include/soc/fsl/qman.h
index cfe00e08e85b..9f484113cfda 100644
--- a/include/soc/fsl/qman.h
+++ b/include/soc/fsl/qman.h
@@ -256,7 +256,7 @@ struct qm_dqrr_entry {
        __be32 context_b;
        struct qm_fd fd;
        u8 __reserved4[32];
-} __packed;
+} __packed __aligned(64);
 #define QM_DQRR_VERB_VBIT              0x80
 #define QM_DQRR_VERB_MASK              0x7f    /* where the verb contains;=
 */
 #define QM_DQRR_VERB_FRAME_DEQUEUE     0x60    /* "this format" */
@@ -289,7 +289,7 @@ union qm_mr_entry {
                __be32 tag;
                struct qm_fd fd;
                u8 __reserved1[32];
-       } __packed ern;
+       } __packed __aligned(64) ern;
        struct {
                u8 verb;
                u8 fqs;         /* Frame Queue Status */


Regards,
Leo
