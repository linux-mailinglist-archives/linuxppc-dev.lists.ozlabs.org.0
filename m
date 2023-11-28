Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2457FAFAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 02:41:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FuguAF4Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfQCl49Q3z3cgd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 12:41:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FuguAF4Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SfQBt16wMz300q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 12:40:37 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5bdf5a025c1so3336757a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 17:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701135635; x=1701740435; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIYliXm0ofkZlM2589umeGJhzNWe6+Y4OO+0F9t5Orc=;
        b=FuguAF4QnkG6xA09tuHSZwntwZSpGAh4LQOnVlOmB7O5RHzLsHunbrQKFuM7DYzxnS
         WeNg09FgcdSYdu+m0bnSgfoadhsv4PoO6djwwUgbqySKnVCrUCLPmhimYAEJJ3ppvY99
         x1qqyxuhUipGngP+EuVpaQCrWcdgCJq3dqL/Ry+7ZQNd08ZdQ6n36fH9CGSYlXb0kj9q
         L+2vBZ/ohNho3e653fI+5LBwE+MyRmDSMcCyTWrW5ZETpodxmWJhvTZUJS+pjsqihbAn
         t0uRy2BVwY1tKzkj339Wzp4dxEtqjaCR0tKbLyUybaTlCK+86vVRbG9tQW9UYW3m5fZK
         uKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701135635; x=1701740435;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aIYliXm0ofkZlM2589umeGJhzNWe6+Y4OO+0F9t5Orc=;
        b=f99xqg0x83L89yxi9SZHTBmuTOcIwmkG0/EXCOeCsDh623fArwjEZlPeBQmerogx6G
         TZ2DwhQiMSQpJrf8GJ3zwEK1lfzWHmDicqhPWk4w+bezJa1Em637PhMczbXj/OmZfMCZ
         NGpL7PPfCAsYmd3c18WWroZ2vWK0roLwXe3qiAg8pDJaack6JGLb+M5Uix61r/nXDJYB
         GFsKKiHmOjtpFCzLCUyU+LBngP7GN5zOhQYaKPRklQrYuVvFtX+nuo1EIVep6b22C4sd
         fP89+YXRGnnCqNwPwwgVQhc02tOEyGphUXhxpZf+F4FKxPX3nijCn8M3S5GEqlUrl8AA
         s/BA==
X-Gm-Message-State: AOJu0YyPw+adHjg8I/lHjRo8W4r956pinef9Rinm5nGfLDlHLSXyTqj1
	nafEcZ6Ig7fZ6kdzDU2BQNuQZ3n36BU=
X-Google-Smtp-Source: AGHT+IHH7Hh0jxT1+lVFU6QA98wAsa4arc2w8gVNhTAdxC8ewdEHb3j2t/uYHVVjyCEKKYPoDbnnzA==
X-Received: by 2002:a17:902:d2cb:b0:1cf:ee3a:2398 with SMTP id n11-20020a170902d2cb00b001cfee3a2398mr1991686plc.42.1701135635185;
        Mon, 27 Nov 2023 17:40:35 -0800 (PST)
Received: from localhost (121-44-66-27.tpgi.com.au. [121.44.66.27])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902b7c300b001cfc9ad74a3sm3101284plz.15.2023.11.27.17.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 17:40:34 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Nov 2023 11:40:29 +1000
Message-Id: <CXA293HNWDZM.154HY9QTPC3QU@wheely>
Subject: Re: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register save
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>, "Christophe Leroy"
 <christophe.leroy@csgroup.eu>, "Timothy Pearson"
 <tpearson@raptorengineering.com>
X-Mailer: aerc 0.15.2
References: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com> <877cmc7ve9.fsf@mail.lhotse> <439072392.48800901.1700498743840.JavaMail.zimbra@raptorengineeringinc.com> <874jhg6lkn.fsf@mail.lhotse> <1294229534.48922001.1700539832331.JavaMail.zimbra@raptorengineeringinc.com> <87leaqjs8x.fsf@mail.lhotse> <1340817182.49635143.1700784119445.JavaMail.zimbra@raptorengineeringinc.com> <1276384468.50536225.1701110354677.JavaMail.zimbra@raptorengineeringinc.com> <89de310e-bb9a-4485-bc8c-3fbefc90e6f6@csgroup.eu> <871qca4rrc.fsf@mail.lhotse>
In-Reply-To: <871qca4rrc.fsf@mail.lhotse>
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, regressions <regressions@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 28, 2023 at 10:59 AM AEST, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Le 27/11/2023 =C3=A0 19:39, Timothy Pearson a =C3=A9crit=C2=A0:
> >> Just wanted to check back and see if this patch was going to be
> >> queued up soon?  We're still having to work around / advertise the
> >> data destruction issues the underlying bug is causing on e.g. Debian
> >> Stable.
> >
> > Has any agreement been reach on the final solution ? Seeing the many=20
> > discussion on patch v2 I had the feeling that it was not the final solu=
tion.
>
> The actual patch is fine I think.
>
> The discussion was about improving the explanation of exactly what's
> happening in the change log, and whether there is a larger bug causing
> FP corruption unrelated to io-uring.

One thing I said is maybe we should remove the "register save" concept
entirely and always giveup. But that would not be suitable for a minimal
fix. I didn't mean it as an alternate fix.

Even if we did always giveup in future, this patch still gives a nicer
API. There would have to be a noticable performance advantage to not
restoring fr0/vs0 after saving before we'd think about changing it back
to clobber, since that encourages foot shooting.

Thanks,
Nick
