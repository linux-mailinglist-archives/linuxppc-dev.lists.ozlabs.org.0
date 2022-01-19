Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7C4942B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jan 2022 23:01:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfKN83WxVz30NB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 09:01:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Qxk8ZlOz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=Qxk8ZlOz; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfKMR0J5mz2ylk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 09:00:32 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id r11so3857304pgr.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 14:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JI5jEcI1hiEGc8WLPgbqQTxkl08Ju0kSWlXY2eIoY9Q=;
 b=Qxk8ZlOzgx4vMG2yojzX5wqvtn5rpGheXm11Z2NyGGBIUXeWLr4XOg3b0q3SyZigtH
 iGaQnWl3zb1OvgUv/kyJhvoC8mXZPAhUz50q7uhfasP7KXx2JeaPhKPNgtg4s8H9BDUo
 vvaHlGGVz9UU7HVblsspusc51ErXeXhgqq8Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JI5jEcI1hiEGc8WLPgbqQTxkl08Ju0kSWlXY2eIoY9Q=;
 b=obKKIp25RVz3R2RSFjfd4CRtdtjXH/5ns4paFrC1ckL/6BUm9fpb4LyAlqL3YifPqf
 qmaO0uS4A4daZHVxr+kEgrcGd9CFppSRT0Kw80eeccdIZkrwOcoeckmr8pOWOTAIWR54
 JIjoafi2qsK9NQuoWdIBt3TXZjX5Mmy1xu7BTPy9GyOiak4Q71CBWTvK05gcCmSzdIpY
 k5+ipoM/lEXSslDZyFvS8zMBRkMJUAd7om89n4xNqy6WmHD/Stq7+z0OPA7Qeab8J9mD
 cOcCgofffkNMxQfsRQ+sM9r9lejC4eXMliufrf3R1+U4mYLfWMOwG07Viqsl7cSvp7K+
 OL/w==
X-Gm-Message-State: AOAM53019CJbX8v/ZRID/UDX/I+OWLo5hD04en/y2nO9Qr2NG7v/zblf
 BCHhUg2Q1rE4YigaMF16NN0E6w==
X-Google-Smtp-Source: ABdhPJwt4Nv5793SP6zTE20w2tmeoTfB5V156ftaoTtLpJsdxvELruQabzZX/RUlM9ATmwCRik8jUg==
X-Received: by 2002:aa7:918e:0:b0:4bb:793:b7a7 with SMTP id
 x14-20020aa7918e000000b004bb0793b7a7mr32876692pfa.71.1642629627636; 
 Wed, 19 Jan 2022 14:00:27 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k12sm602597pfc.107.2022.01.19.14.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 14:00:26 -0800 (PST)
Date: Wed, 19 Jan 2022 14:00:26 -0800
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 11/12] lkdtm: Fix execute_[user]_location()
Message-ID: <202201191359.5E67E74A@keescook>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <d4688c2af08dda706d3b6786ae5ec5a74e6171f1.1634457599.git.christophe.leroy@csgroup.eu>
 <e7793192-6879-490d-1f37-3d6d6908a121@csgroup.eu>
 <c635dff6-2bca-3486-014f-12ae00bd1777@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c635dff6-2bca-3486-014f-12ae00bd1777@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-parisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 19, 2022 at 08:28:54PM +0100, Christophe Leroy wrote:
> Hi Kees,
> 
> 
> Le 17/12/2021 à 12:49, Christophe Leroy a écrit :
> > Hi Kees,
> > 
> > Le 17/10/2021 à 14:38, Christophe Leroy a écrit :
> > > execute_location() and execute_user_location() intent
> > > to copy do_nothing() text and execute it at a new location.
> > > However, at the time being it doesn't copy do_nothing() function
> > > but do_nothing() function descriptor which still points to the
> > > original text. So at the end it still executes do_nothing() at
> > > its original location allthough using a copied function descriptor.
> > > 
> > > So, fix that by really copying do_nothing() text and build a new
> > > function descriptor by copying do_nothing() function descriptor and
> > > updating the target address with the new location.
> > > 
> > > Also fix the displayed addresses by dereferencing do_nothing()
> > > function descriptor.
> > > 
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > 
> > Do you have any comment to this patch and to patch 12 ?
> > 
> > If not, is it ok to get your acked-by ?
> 
> Any feedback please, even if it's to say no feedback ?

Hi! Thanks for the ping; I haven't had time yet to look at this, but
with -rc1 coming, I should be able to task-switch back to LKDTM for the
dev cycle and I can give some feedback.

-Kees

> 
> Many thanks,
> Christophe
> 
> > 
> > Thanks
> > Christophe
> > 
> > > ---
> > >   drivers/misc/lkdtm/perms.c | 37 ++++++++++++++++++++++++++++---------
> > >   1 file changed, 28 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> > > index 035fcca441f0..1cf24c4a79e9 100644
> > > --- a/drivers/misc/lkdtm/perms.c
> > > +++ b/drivers/misc/lkdtm/perms.c
> > > @@ -44,19 +44,34 @@ static noinline void do_overwritten(void)
> > >       return;
> > >   }
> > > +static void *setup_function_descriptor(func_desc_t *fdesc, void *dst)
> > > +{
> > > +    if (!have_function_descriptors())
> > > +        return dst;
> > > +
> > > +    memcpy(fdesc, do_nothing, sizeof(*fdesc));
> > > +    fdesc->addr = (unsigned long)dst;
> > > +    barrier();
> > > +
> > > +    return fdesc;
> > > +}
> > > +
> > >   static noinline void execute_location(void *dst, bool write)
> > >   {
> > > -    void (*func)(void) = dst;
> > > +    void (*func)(void);
> > > +    func_desc_t fdesc;
> > > +    void *do_nothing_text = dereference_function_descriptor(do_nothing);
> > > -    pr_info("attempting ok execution at %px\n", do_nothing);
> > > +    pr_info("attempting ok execution at %px\n", do_nothing_text);
> > >       do_nothing();
> > >       if (write == CODE_WRITE) {
> > > -        memcpy(dst, do_nothing, EXEC_SIZE);
> > > +        memcpy(dst, do_nothing_text, EXEC_SIZE);
> > >           flush_icache_range((unsigned long)dst,
> > >                      (unsigned long)dst + EXEC_SIZE);
> > >       }
> > > -    pr_info("attempting bad execution at %px\n", func);
> > > +    pr_info("attempting bad execution at %px\n", dst);
> > > +    func = setup_function_descriptor(&fdesc, dst);
> > >       func();
> > >       pr_err("FAIL: func returned\n");
> > >   }
> > > @@ -66,16 +81,19 @@ static void execute_user_location(void *dst)
> > >       int copied;
> > >       /* Intentionally crossing kernel/user memory boundary. */
> > > -    void (*func)(void) = dst;
> > > +    void (*func)(void);
> > > +    func_desc_t fdesc;
> > > +    void *do_nothing_text = dereference_function_descriptor(do_nothing);
> > > -    pr_info("attempting ok execution at %px\n", do_nothing);
> > > +    pr_info("attempting ok execution at %px\n", do_nothing_text);
> > >       do_nothing();
> > > -    copied = access_process_vm(current, (unsigned long)dst, do_nothing,
> > > +    copied = access_process_vm(current, (unsigned long)dst,
> > > do_nothing_text,
> > >                      EXEC_SIZE, FOLL_WRITE);
> > >       if (copied < EXEC_SIZE)
> > >           return;
> > > -    pr_info("attempting bad execution at %px\n", func);
> > > +    pr_info("attempting bad execution at %px\n", dst);
> > > +    func = setup_function_descriptor(&fdesc, dst);
> > >       func();
> > >       pr_err("FAIL: func returned\n");
> > >   }
> > > @@ -153,7 +171,8 @@ void lkdtm_EXEC_VMALLOC(void)
> > >   void lkdtm_EXEC_RODATA(void)
> > >   {
> > > -    execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
> > > +    execute_location(dereference_function_descriptor(lkdtm_rodata_do_nothing),
> > > 
> > > +             CODE_AS_IS);
> > >   }
> > >   void lkdtm_EXEC_USERSPACE(void)
> > > 

-- 
Kees Cook
