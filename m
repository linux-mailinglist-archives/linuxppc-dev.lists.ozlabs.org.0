Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB1D4FAFFB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 22:03:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc2wr6vmxz3bk2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 06:03:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RZFAduIY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632;
 helo=mail-ej1-x632.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RZFAduIY; dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc2w76T7wz2xnD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 06:02:45 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id u15so8374934ejf.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 13:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GnYyWArUhJQqTQwEof5GYvJV/QLYrf7vSksV6hEcM50=;
 b=RZFAduIY7ZscSzkRGZF5F0gRjrdt4WlKE3VvBL8OJXHhmiAkl3OPpu3EOHelHlrkuj
 M7PSPCv6fTsFkHwR0B6fSdV/ROHl4dxk1GyWtGm+OpNdNlVvi5G8tkVIDwjWdoCazOkb
 CZw9B76aLmVvmvbYAqzD0vLx3hoooCibn6UV82lgPtAMWCDqqkvy+7XI7Mc6cDYeJ0KH
 KoMffJvyglvdV7w36x69mWGpV8HbIXlGJjXrjEeMoQOpEkf41J72TiDP2dldEs/3Usng
 34ioGeGyMtwA2NoEc9T9GSpWhFMWyXJ4PIDuLmghDLEq8VoviaAIXn++a/B9CJXdECRz
 I9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GnYyWArUhJQqTQwEof5GYvJV/QLYrf7vSksV6hEcM50=;
 b=c8iBXxAM/7SzVQZNlp09VD9rhcND/pSPjtW8Kp8smEJQ46DClTev/vh123m6E2aAoG
 2UKa1NSRpiU8XSrhT+anbKXaIMfrA5dEfII1Dq101O73G/oATD3ZMHIbD9255+xOGcw9
 pW4OHjaN1TZ9SbGSqDSIrXHu5QzkXIWdmDKCpbKECPY4+MXVxM3l3kcT6mEgrQbWLFmw
 mQT1YCuu4aSXwbQcgxmamFBHQ6MuQHlzGnqYhOpwNuQq6Ria/jwahob1fIIiHKmqShtF
 iuSe254oywedj4Tcq9CssOuy73iyJp27zKzxUt2s1wba5jdtWBzYnMZdxGQuQSZCRO8b
 D+bg==
X-Gm-Message-State: AOAM533hAg/SzwmLfhtGUqkW1ZZAbHrwuQ8+T4rvQ8EY/txsdqd/eRqQ
 I8U2PgHEgKjgcaB8jwQgZO4=
X-Google-Smtp-Source: ABdhPJxHbIQZEnUpzRU1OvqhvO3HGBsAFI2htAXaE0HJyeFzwPILH2y+MafSZ7wkBhJGry58b2nxig==
X-Received: by 2002:a17:907:2d92:b0:6e8:4b2a:e41f with SMTP id
 gt18-20020a1709072d9200b006e84b2ae41fmr12659637ejc.124.1649620958790; 
 Sun, 10 Apr 2022 13:02:38 -0700 (PDT)
Received: from skbuf ([188.26.57.45]) by smtp.gmail.com with ESMTPSA id
 i3-20020a1709067a4300b006dd879b4680sm11321691ejo.112.2022.04.10.13.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 13:02:38 -0700 (PDT)
Date: Sun, 10 Apr 2022 23:02:35 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
Message-ID: <20220410200235.6mtdkd2f73ijxknn@skbuf>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220408114120.tvf2lxvhfqbnrlml@skbuf>
 <FA317E17-3B09-411B-9DF6-05BDD320D988@gmail.com>
 <C9081CE3-B008-48DA-A97C-76F51D4F189F@gmail.com>
 <20220410110508.em3r7z62ufqcbrfm@skbuf>
 <935062D0-C657-4C79-A0BE-70141D052EC0@gmail.com>
 <C88FE232-417C-4029-A79E-9A7E807D2FE7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C88FE232-417C-4029-A79E-9A7E807D2FE7@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>, Di Zhu <zhudi21@huawei.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Colin Ian King <colin.king@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Casper Andersson <casper.casan@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 10, 2022 at 08:24:37PM +0200, Jakob Koschel wrote:
> Btw, I just realized that the if (!pos) is not necessary. This should simply do it:
> 
> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
> index b7e95d60a6e4..2d59e75a9e3d 100644
> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
> @@ -28,6 +28,7 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
>  		list_add(&e->list, &gating_cfg->entries);
>  	} else {
> +		struct list_head *pos = &gating_cfg->entries;
>  		struct sja1105_gate_entry *p;
>  
>  		list_for_each_entry(p, &gating_cfg->entries, list) {
>  			if (p->interval == e->interval) {
> @@ -37,10 +38,12 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
>  				goto err;
>  			}
>  
> -			if (e->interval < p->interval)
> +			if (e->interval < p->interval) {
> +				pos = &p->list;
>  				break;
> +			}
>  		}
> -		list_add(&e->list, p->list.prev);
> +		list_add(&e->list, pos->prev);
>  	}
>  
>  	gating_cfg->num_entries++;
> -- 
> 2.25.1

I think we can give this a turn that is actually beneficial for the driver.
I've prepared and tested 3 patches on this function, see below.
Concrete improvements:
- that thing with list_for_each_entry() and list_for_each()
- no more special-casing of an empty list
- simplifying the error path
- that thing with list_add_tail()

What do you think about the changes below?

From 5b952b75e239cbe96729cf78c17e8d9725c9617c Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Sun, 10 Apr 2022 22:21:41 +0300
Subject: [PATCH 1/3] net: dsa: sja1105: remove use of iterator after
 list_for_each_entry() loop

Jakob Koschel explains in the link below that there is a desire to
syntactically change list_for_each_entry() and list_for_each() such that
it becomes impossible to use the iterator variable outside the scope of
the loop.

Although sja1105_insert_gate_entry() makes legitimate use of the
iterator pointer when it breaks out, the pattern it uses may become
illegal, so it needs to change.

It is deemed acceptable to use a copy of the loop iterator, and
sja1105_insert_gate_entry() only needs to know the list_head element
before which the list insertion should be made. So let's profit from the
occasion and refactor the list iteration to a dedicated function.

An additional benefit is given by the fact that with the helper function
in place, we no longer need to special-case the empty list, since it is
equivalent to not having found any gating entry larger than the
specified interval in the list. We just need to insert at the tail of
that list (list_add vs list_add_tail on an empty list does the same
thing).

Link: https://patchwork.kernel.org/project/netdevbpf/patch/20220407102900.3086255-3-jakobkoschel@gmail.com/#24810127
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/sja1105/sja1105_vl.c | 46 ++++++++++++++++++----------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
index b7e95d60a6e4..369be2ac3587 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -7,6 +7,27 @@
 
 #define SJA1105_SIZE_VL_STATUS			8
 
+static struct list_head *
+sja1105_first_entry_longer_than(struct list_head *entries,
+				s64 interval,
+				struct netlink_ext_ack *extack)
+{
+	struct sja1105_gate_entry *p;
+
+	list_for_each_entry(p, entries, list) {
+		if (p->interval == interval) {
+			NL_SET_ERR_MSG_MOD(extack, "Gate conflict");
+			return ERR_PTR(-EBUSY);
+		}
+
+		if (interval < p->interval)
+			return &p->list;
+	}
+
+	/* Empty list, or specified interval is largest within the list */
+	return entries;
+}
+
 /* Insert into the global gate list, sorted by gate action time. */
 static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 				     struct sja1105_rule *rule,
@@ -14,6 +35,7 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 				     struct netlink_ext_ack *extack)
 {
 	struct sja1105_gate_entry *e;
+	struct list_head *pos;
 	int rc;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
@@ -24,25 +46,15 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 	e->gate_state = gate_state;
 	e->interval = entry_time;
 
-	if (list_empty(&gating_cfg->entries)) {
-		list_add(&e->list, &gating_cfg->entries);
-	} else {
-		struct sja1105_gate_entry *p;
-
-		list_for_each_entry(p, &gating_cfg->entries, list) {
-			if (p->interval == e->interval) {
-				NL_SET_ERR_MSG_MOD(extack,
-						   "Gate conflict");
-				rc = -EBUSY;
-				goto err;
-			}
-
-			if (e->interval < p->interval)
-				break;
-		}
-		list_add(&e->list, p->list.prev);
+	pos = sja1105_first_entry_longer_than(&gating_cfg->entries,
+					      e->interval, extack);
+	if (IS_ERR(pos)) {
+		rc = PTR_ERR(pos);
+		goto err;
 	}
 
+	list_add(&e->list, pos->prev);
+
 	gating_cfg->num_entries++;
 
 	return 0;
-- 
2.25.1

From b6385f62d730b69007ea218e885461542ca4c44c Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Sun, 10 Apr 2022 22:34:35 +0300
Subject: [PATCH 2/3] net: dsa: sja1105: reorder
 sja1105_first_entry_longer_than with memory allocation

sja1105_first_entry_longer_than() does not make use of the full struct
sja1105_gate_entry *e, just of e->interval which is set from the passed
entry_time.

This means that if there is a gate conflict, we have allocated e for
nothing, just to free it later. Reorder the memory allocation and the
function call, to avoid that and simplify the error unwind path.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/sja1105/sja1105_vl.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
index 369be2ac3587..e5ea8eb9ec4e 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -36,7 +36,11 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 {
 	struct sja1105_gate_entry *e;
 	struct list_head *pos;
-	int rc;
+
+	pos = sja1105_first_entry_longer_than(&gating_cfg->entries,
+					      entry_time, extack);
+	if (IS_ERR(pos))
+		return PTR_ERR(pos);
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
 	if (!e)
@@ -45,22 +49,11 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 	e->rule = rule;
 	e->gate_state = gate_state;
 	e->interval = entry_time;
-
-	pos = sja1105_first_entry_longer_than(&gating_cfg->entries,
-					      e->interval, extack);
-	if (IS_ERR(pos)) {
-		rc = PTR_ERR(pos);
-		goto err;
-	}
-
 	list_add(&e->list, pos->prev);
 
 	gating_cfg->num_entries++;
 
 	return 0;
-err:
-	kfree(e);
-	return rc;
 }
 
 /* The gate entries contain absolute times in their e->interval field. Convert
-- 
2.25.1

From 8aa272b8a3f53aba7b80f181b275e040b9aaed8d Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Sun, 10 Apr 2022 22:37:14 +0300
Subject: [PATCH 3/3] net: dsa: sja1105: use list_add_tail(pos) instead of
 list_add(pos->prev)

When passed a non-head list element, list_add_tail() actually adds the
new element to its left, which is what we want. Despite the slightly
confusing name, use the dedicated function which does the same thing as
the open-coded list_add(pos->prev).

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/sja1105/sja1105_vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
index e5ea8eb9ec4e..7fe9b18f1cbd 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -49,7 +49,7 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 	e->rule = rule;
 	e->gate_state = gate_state;
 	e->interval = entry_time;
-	list_add(&e->list, pos->prev);
+	list_add_tail(&e->list, pos);
 
 	gating_cfg->num_entries++;
 
-- 
2.25.1

