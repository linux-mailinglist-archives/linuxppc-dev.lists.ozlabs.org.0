Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D7937508E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 10:09:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbR7L6C6Sz3bPL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 18:09:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oFttSbCl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oFttSbCl; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbR0f2xNqz2xy3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 18:03:29 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id v191so4525592pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 May 2021 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=o2HhZnUd2hg34oVX4+0RbngJc3/vp1BGVjtR9KvSSMA=;
 b=oFttSbCl7PNt0tHTb2qugwRv2yawJtTSyNCAJe4v6JWnQkTjCTzsNllb/12np1t/8L
 QSGxb837KPjp0ruDSyYh9lr0cShyzzY8zaGHc16vDDOEkkOukdE0787hQrPzs/81VBwy
 Nc+o1h0Ai+YY0xXZQ53pDjudSlhTL0Ft1hmiPMmL/4KVswdMAjJwQFeTjD/uAO2GXiM4
 Riyd2UTBS73e7ixQtEGT5bFCl2AK1b3Fg3epW0KsXPUlv7qARhssfEkl+366zAczmqFg
 vDNMjhnyNyWErf6GhU7sswGcPxCd+J5/mMhCJrNJYkai9glfGulrHwkvRM8i9x9VQ0+v
 KIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=o2HhZnUd2hg34oVX4+0RbngJc3/vp1BGVjtR9KvSSMA=;
 b=emONJlBv4O7cElIJ/uokdB4gTI3BUE1L3Y358MGHjw7AGzY+mTqWbON9My1UXkWJra
 jmaOaTkqoBxYevU0vKK2VIeHoghahWl3U6gKzELWZG8qmPitFpR12x82RcbR5tr8U7ES
 JSoVB+UJFovvp0TM1PBEPmzjPg0zeSIXfijcWKOXMDl5wAhQj55Rr6I4eXl+fEUjwaPq
 5cCWEx2/DXlW9Gby0FGilEcjVX0eD2PTL3KxEOePOzDr5g9qSoonQc9psHBsq5DvegcH
 +REu5R4K1fFh4Wf6+TqqHyFo2G18I2ZLC449FKdmGYrwfR3smXDsNe72h5qTOA1qrviO
 oYIw==
X-Gm-Message-State: AOAM530H1bn+pnvbeEcm/2/DBLPXIMhJMNguUXNfB/b0VIUG9jDhc6D3
 BV7qbIjtQX5OX4hpADa389GglQ9nSKITAJbtkTU=
X-Google-Smtp-Source: ABdhPJyGJaUa5qBqC8ardKNNykagZJxnqLgcgHo85ekomae2nztlNpGg2anAlMHEjFd5QSCMnRC7dhwA6qhaRj7GrzM=
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr3106132pfb.7.1620288204825; Thu, 06
 May 2021 01:03:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90b:d81:0:0:0:0 with HTTP; Thu, 6 May 2021 01:03:24
 -0700 (PDT)
In-Reply-To: <20210506011015.17347-4-chris.packham@alliedtelesis.co.nz>
References: <20210506011015.17347-1-chris.packham@alliedtelesis.co.nz>
 <20210506011015.17347-4-chris.packham@alliedtelesis.co.nz>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 May 2021 11:03:24 +0300
Message-ID: <CAHp75VecRQT4zzzcQBJ6vsfNEWhj8T3f9VRNd8mDrwNee2kamA@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: mpc: implement erratum A-004447 workaround
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: multipart/alternative; boundary="000000000000e1e6ed05c1a4beb8"
X-Mailman-Approved-At: Thu, 06 May 2021 18:08:53 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wsa@kernel.org" <wsa@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000e1e6ed05c1a4beb8
Content-Type: text/plain; charset="UTF-8"

On Thursday, May 6, 2021, Chris Packham <chris.packham@alliedtelesis.co.nz>
wrote:

> The P2040/P2041 has an erratum where the normal i2c recovery mechanism
> does not work. Implement the alternative recovery mechanism documented
> in the P2040 Chip Errata Rev Q.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  drivers/i2c/busses/i2c-mpc.c | 88 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 86 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index 30d9e89a3db2..052e37718771 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -45,6 +45,7 @@
>  #define CCR_MTX  0x10
>  #define CCR_TXAK 0x08
>  #define CCR_RSTA 0x04
> +#define CCR_RSVD 0x02
>
>  #define CSR_MCF  0x80
>  #define CSR_MAAS 0x40
> @@ -97,7 +98,7 @@ struct mpc_i2c {
>         u32 block;
>         int rc;
>         int expect_rxack;
> -
> +       bool has_errata_A004447;
>  };
>
>  struct mpc_i2c_divider {
> @@ -136,6 +137,83 @@ static void mpc_i2c_fixup(struct mpc_i2c *i2c)
>         }
>  }
>
> +static int i2c_mpc_wait_sr(struct mpc_i2c *i2c, int mask)
> +{
> +       unsigned long timeout = jiffies + usecs_to_jiffies(100);
> +       int ret = 0;
> +
> +       while ((readb(i2c->base + MPC_I2C_SR) & mask) == 0) {
> +               if (time_after(jiffies, timeout)) {
> +                       ret = -ETIMEDOUT;
> +                       break;
> +               }
> +               cond_resched();
> +       }
> +
> +       return ret;
> +}


readb_poll_timeout()


> +
> +/*
> + * Workaround for Erratum A004447. From the P2040CE Rev Q
> + *
> + * 1.  Set up the frequency divider and sampling rate.
> + * 2.  I2CCR - a0h
> + * 3.  Poll for I2CSR[MBB] to get set.
> + * 4.  If I2CSR[MAL] is set (an indication that SDA is stuck low), then
> go to
> + *     step 5. If MAL is not set, then go to step 13.
> + * 5.  I2CCR - 00h
> + * 6.  I2CCR - 22h
> + * 7.  I2CCR - a2h
> + * 8.  Poll for I2CSR[MBB] to get set.
> + * 9.  Issue read to I2CDR.
> + * 10. Poll for I2CSR[MIF] to be set.
> + * 11. I2CCR - 82h
> + * 12. Workaround complete. Skip the next steps.
> + * 13. Issue read to I2CDR.
> + * 14. Poll for I2CSR[MIF] to be set.
> + * 15. I2CCR - 80h
> + */
> +static void mpc_i2c_fixup_A004447(struct mpc_i2c *i2c)
> +{
> +       int ret;
> +       u32 val;
> +
> +       writeccr(i2c, CCR_MEN | CCR_MSTA);
> +       ret = i2c_mpc_wait_sr(i2c, CSR_MBB);
> +       if (ret) {
> +               dev_err(i2c->dev, "timeout waiting for CSR_MBB\n");
> +               return;
> +       }
> +
> +       val = readb(i2c->base + MPC_I2C_SR);
> +
> +       if (val & CSR_MAL) {
> +               writeccr(i2c, 0x00);
> +               writeccr(i2c, CCR_MSTA | CCR_RSVD);
> +               writeccr(i2c, CCR_MEN | CCR_MSTA | CCR_RSVD);
> +               ret = i2c_mpc_wait_sr(i2c, CSR_MBB);
> +               if (ret) {
> +                       dev_err(i2c->dev, "timeout waiting for CSR_MBB\n");
> +                       return;
> +               }
> +               val = readb(i2c->base + MPC_I2C_DR);
> +               ret = i2c_mpc_wait_sr(i2c, CSR_MIF);
> +               if (ret) {
> +                       dev_err(i2c->dev, "timeout waiting for CSR_MIF\n");
> +                       return;
> +               }
> +               writeccr(i2c, CCR_MEN | CCR_RSVD);
> +       } else {
> +               val = readb(i2c->base + MPC_I2C_DR);
> +               ret = i2c_mpc_wait_sr(i2c, CSR_MIF);
> +               if (ret) {
> +                       dev_err(i2c->dev, "timeout waiting for CSR_MIF\n");
> +                       return;
> +               }
> +               writeccr(i2c, CCR_MEN);
> +       }
> +}
> +
>  #if defined(CONFIG_PPC_MPC52xx) || defined(CONFIG_PPC_MPC512x)
>  static const struct mpc_i2c_divider mpc_i2c_dividers_52xx[] = {
>         {20, 0x20}, {22, 0x21}, {24, 0x22}, {26, 0x23},
> @@ -670,7 +748,10 @@ static int fsl_i2c_bus_recovery(struct i2c_adapter
> *adap)
>  {
>         struct mpc_i2c *i2c = i2c_get_adapdata(adap);
>
> -       mpc_i2c_fixup(i2c);
> +       if (i2c->has_errata_A004447)
> +               mpc_i2c_fixup_A004447(i2c);
> +       else
> +               mpc_i2c_fixup(i2c);
>
>         return 0;
>  }
> @@ -767,6 +848,9 @@ static int fsl_i2c_probe(struct platform_device *op)
>         }
>         dev_info(i2c->dev, "timeout %u us\n", mpc_ops.timeout * 1000000 /
> HZ);
>
> +       if (of_property_read_bool(op->dev.of_node,
> "fsl,i2c-erratum-a004447"))
> +               i2c->has_errata_A004447 = true;
> +
>         i2c->adap = mpc_ops;
>         scnprintf(i2c->adap.name, sizeof(i2c->adap.name),
>                   "MPC adapter (%s)", of_node_full_name(op->dev.of_node));
> --
> 2.31.1
>
>

-- 
With Best Regards,
Andy Shevchenko

--000000000000e1e6ed05c1a4beb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, May 6, 2021, Chris Packham &lt;<a href=3D"mailto:chris=
.packham@alliedtelesis.co.nz">chris.packham@alliedtelesis.co.nz</a>&gt; wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">The P2040/P2041 has an erratum where =
the normal i2c recovery mechanism<br>
does not work. Implement the alternative recovery mechanism documented<br>
in the P2040 Chip Errata Rev Q.<br>
<br>
Signed-off-by: Chris Packham &lt;<a href=3D"mailto:chris.packham@alliedtele=
sis.co.nz">chris.packham@alliedtelesis.<wbr>co.nz</a>&gt;<br>
---<br>
=C2=A0drivers/i2c/busses/i2c-mpc.c | 88 ++++++++++++++++++++++++++++++<wbr>=
+++++-<br>
=C2=A01 file changed, 86 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c<br=
>
index 30d9e89a3db2..052e37718771 100644<br>
--- a/drivers/i2c/busses/i2c-mpc.c<br>
+++ b/drivers/i2c/busses/i2c-mpc.c<br>
@@ -45,6 +45,7 @@<br>
=C2=A0#define CCR_MTX=C2=A0 0x10<br>
=C2=A0#define CCR_TXAK 0x08<br>
=C2=A0#define CCR_RSTA 0x04<br>
+#define CCR_RSVD 0x02<br>
<br>
=C2=A0#define CSR_MCF=C2=A0 0x80<br>
=C2=A0#define CSR_MAAS 0x40<br>
@@ -97,7 +98,7 @@ struct mpc_i2c {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 block;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int expect_rxack;<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool has_errata_A004447;<br>
=C2=A0};<br>
<br>
=C2=A0struct mpc_i2c_divider {<br>
@@ -136,6 +137,83 @@ static void mpc_i2c_fixup(struct mpc_i2c *i2c)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
+static int i2c_mpc_wait_sr(struct mpc_i2c *i2c, int mask)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long timeout =3D jiffies + usecs_to_ji=
ffies(100);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while ((readb(i2c-&gt;base + MPC_I2C_SR) &amp; =
mask) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (time_after(jiff=
ies, timeout)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D -ETIMEDOUT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cond_resched();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}</blockquote><div><br></div><div>readb_poll_timeout()</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
+<br>
+/*<br>
+ * Workaround for Erratum A004447. From the P2040CE Rev Q<br>
+ *<br>
+ * 1.=C2=A0 Set up the frequency divider and sampling rate.<br>
+ * 2.=C2=A0 I2CCR - a0h<br>
+ * 3.=C2=A0 Poll for I2CSR[MBB] to get set.<br>
+ * 4.=C2=A0 If I2CSR[MAL] is set (an indication that SDA is stuck low), th=
en go to<br>
+ *=C2=A0 =C2=A0 =C2=A0step 5. If MAL is not set, then go to step 13.<br>
+ * 5.=C2=A0 I2CCR - 00h<br>
+ * 6.=C2=A0 I2CCR - 22h<br>
+ * 7.=C2=A0 I2CCR - a2h<br>
+ * 8.=C2=A0 Poll for I2CSR[MBB] to get set.<br>
+ * 9.=C2=A0 Issue read to I2CDR.<br>
+ * 10. Poll for I2CSR[MIF] to be set.<br>
+ * 11. I2CCR - 82h<br>
+ * 12. Workaround complete. Skip the next steps.<br>
+ * 13. Issue read to I2CDR.<br>
+ * 14. Poll for I2CSR[MIF] to be set.<br>
+ * 15. I2CCR - 80h<br>
+ */<br>
+static void mpc_i2c_fixup_A004447(struct mpc_i2c *i2c)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0writeccr(i2c, CCR_MEN | CCR_MSTA);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_mpc_wait_sr(i2c, CSR_MBB);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(i2c-&gt;dev=
, &quot;timeout waiting for CSR_MBB\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readb(i2c-&gt;base + MPC_I2C_SR);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val &amp; CSR_MAL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writeccr(i2c, 0x00)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writeccr(i2c, CCR_M=
STA | CCR_RSVD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writeccr(i2c, CCR_M=
EN | CCR_MSTA | CCR_RSVD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_mpc_wai=
t_sr(i2c, CSR_MBB);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(i2c-&gt;dev, &quot;timeout waiting for CSR_MBB\n&quot;);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readb(i2c-&=
gt;base + MPC_I2C_DR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_mpc_wai=
t_sr(i2c, CSR_MIF);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(i2c-&gt;dev, &quot;timeout waiting for CSR_MIF\n&quot;);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writeccr(i2c, CCR_M=
EN | CCR_RSVD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D readb(i2c-&=
gt;base + MPC_I2C_DR);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_mpc_wai=
t_sr(i2c, CSR_MIF);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(i2c-&gt;dev, &quot;timeout waiting for CSR_MIF\n&quot;);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writeccr(i2c, CCR_M=
EN);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
+<br>
=C2=A0#if defined(CONFIG_PPC_MPC52xx) || defined(CONFIG_PPC_MPC512x)<br>
=C2=A0static const struct mpc_i2c_divider mpc_i2c_dividers_52xx[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {20, 0x20}, {22, 0x21}, {24, 0x22}, {26, 0x23},=
<br>
@@ -670,7 +748,10 @@ static int fsl_i2c_bus_recovery(struct i2c_adapter *ad=
ap)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mpc_i2c *i2c =3D i2c_get_adapdata(adap);=
<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0mpc_i2c_fixup(i2c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (i2c-&gt;has_errata_A004447)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mpc_i2c_fixup_A0044=
47(i2c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mpc_i2c_fixup(i2c);=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
@@ -767,6 +848,9 @@ static int fsl_i2c_probe(struct platform_device *op)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_info(i2c-&gt;dev, &quot;timeout %u us\n&quo=
t;, mpc_ops.timeout * 1000000 / HZ);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_bool(op-&gt;<wbr>dev.of_no=
de, &quot;fsl,i2c-erratum-a004447&quot;))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i2c-&gt;has_errata_=
A004447 =3D true;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c-&gt;adap =3D mpc_ops;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 scnprintf(i2c-&gt;<a href=3D"http://adap.name" =
target=3D"_blank">adap.name</a>, sizeof(i2c-&gt;<a href=3D"http://adap.name=
" target=3D"_blank">adap.name</a>),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;MPC ad=
apter (%s)&quot;, of_node_full_name(op-&gt;dev.of_<wbr>node));<br>
-- <br>
2.31.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--000000000000e1e6ed05c1a4beb8--
