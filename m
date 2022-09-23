Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9005E74B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:18:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYk5b2vdVz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:18:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qGTKCyHZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qGTKCyHZ;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYk4x66KLz2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:17:53 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so4561559pjk.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=vydazv6+h5spM18LFXgq/17X1W+tTD1sYZJbaJkA4X8=;
        b=qGTKCyHZiYIs2nrvIh/P6WdhgZ3dsR6x8/dL5NS2oB7iioUkiahVVSQ2T7GyEkeai3
         VosaAS2qC/qUnFl1rY/Zw3coyKxxnihptUj01eAYCodf8Uo1icNNO/RXZbRn5BeYc6dg
         vyGadXY4ioIK4HVfsjLy/VF7fgwpQF3wYanAVXlQgpC+cBUyKpAnipcjlD10o8PhOafR
         II8kVZHw89pqkK8ZUHqR/glLX5X5fuv/e69s7siPQW6WSvCmhQRNIUymO/AQY0YOUpaF
         EJVrhkz2FmehSYp3UiXomru1J12YcJoiDFUGyqr04OqqKRi0AJKSd2bWfcqfRCFfkWlE
         nNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=vydazv6+h5spM18LFXgq/17X1W+tTD1sYZJbaJkA4X8=;
        b=SerKEQZs8/KScggiYhbPYkqO3P07lq3eBGWseskf8icz8TCZfQEahr1xcWRQtzFGIb
         MQldUbyrazRCg4oxcz3VaRpGEL5FrH2z1mcNHiIM+sOirap2B3U2iW/JF7qJB8/Z5iBO
         oH6ZBcFbggpVoaci20XiiI+EduDwNmDMtsQ5AK4piFU2dFYazgfV2TuvSt15BNdmJd8I
         +L2XgCQJRrUOSB5xgE5N2nNU4C+jv7Uosv2qxFuOiNCJn4VKjNinVma4cWR67KPwMHV7
         ZBRYb/1tORaqzMiVDv+1K2JmAcp/tjrAHdPbEHXXRfeDmxibu8dEQBn4UeWiS4X+etQ1
         z9lw==
X-Gm-Message-State: ACrzQf3aCOpSQ/3kPtmxNCzjr13vp4xGi1l1Yjk7JM8XaXtjddzq9/Q0
	VoFIevQLoFDQuw090yisCIU=
X-Google-Smtp-Source: AMsMyM5WmUFUXTuyh/Pj9kyItQsfxjOtFP06WZoXHOsUOEokZ6vAy4PaWfSsgcMOHXUSelWcYle6rA==
X-Received: by 2002:a17:902:c245:b0:178:3912:f1fe with SMTP id 5-20020a170902c24500b001783912f1femr7333208plg.13.1663917470257;
        Fri, 23 Sep 2022 00:17:50 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090a2c4900b001fd76f7a0d1sm915469pjm.54.2022.09.23.00.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 00:17:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Sep 2022 17:17:45 +1000
Message-Id: <CN3LIJ54GWR1.LTJXTAPJG39S@bobo>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
Subject: Re: [PATCH 1/2] powerpc/64s: Fix GENERIC_CPU build flags for PPC970
 / G5
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220921014103.587954-1-npiggin@gmail.com>
 <20220921185031.GE25951@gate.crashing.org>
In-Reply-To: <20220921185031.GE25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Sep 22, 2022 at 4:50 AM AEST, Segher Boessenkool wrote:
> On Wed, Sep 21, 2022 at 11:41:02AM +1000, Nicholas Piggin wrote:
> > Big-endian GENERIC_CPU supports 970, but builds with -mcpu=3Dpower5.
> > POWER5 is ISA v2.02 whereas 970 is v2.01 plus Altivec. 2.02 added
> > the popcntb instruction which a compiler might use.
> >=20
> > Use -mcpu=3Dpower4.
> >=20
> > Fixes: 471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
>
> Thank you!
>
> Maybe superfluous, but some more context: GCC's -mcpu=3Dpower4 means
> POWER4+, ISA 2.01, according to our documentation.  There is no
> difference with ISA 2.00 (what plain POWER4 implements) for anything
> GCC does.

Huh, okay. Well I guess we are past that point now, interesting that
another ISA version was done for 4+ though, and then another for 5.
I don't see a list of changes from 2.00 in the public version, I
wonder what else changed other than mtmsrd.

Thanks,
Nick
