Return-Path: <linuxppc-dev+bounces-7785-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5A6A93772
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 14:49:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfF2N6kGpz2ydx;
	Fri, 18 Apr 2025 22:49:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744980556;
	cv=none; b=V3KpL1/HUok5MCClQJ+v6ibiVHwPqknrTWqveI2b4mNxGnc6zJxR4nymS4geDw6wj3Bx9ykOQxYuOc92VAIxYRak6Hhw3LoiHTxYC9Y24OYxtZe8aVQkWrK6WpELNpUhl1dJEd16F4IssDkMTaXsDlPiOchlVuLAHRVODfZmE0j2MxvcA5pE39ey8B1+yzIx2Y0MKrQSFXfbCdN7RkBZC2qfhic8yt1WFdZBq5SasEbLSmFZGuGHoKrXsiqlJ82KFza7tcA1meDMWd1Ta7aLaRVxriZi8wLkhufaTk0F/z7CY00txPQBW970ndE+2eRj5qY6+yQ4+jk8JwblJdO8FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744980556; c=relaxed/relaxed;
	bh=hGm94WkSvEKAT80t6SgDIndlW5MDyMlulTb0cPlczvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmERsG7eiQTTi+ce+v4LuZ3TP9UvzemfCInjwst1ibwdjtr3NLCC9QTdwqdiiCwrVBvg+gQaiwt4OiKrGrwhXpgBmdriQHlIog6H9YAEQNst/7Zw8EMIHaFpn98QxpwzgcelXcKVEFkENTr3V5E7ovCuIN6nhiRwoir3WAf1DzlOmcI74o96hb6wQ19sT5+t970jbtuV87LixcLgstfAywwDntI+QwIU/SNQT1EOATS2Iup3ulI49GF2qnCLpUP3fbZccrUTbUEc5UobaevDoC+qv2Qnd+JIeFsN4GPuNnuY4ADIY3w14MZoK2MSSgy8dqrwv2sYRADVrTlzgVQy6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NMMDwE4k; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NMMDwE4k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfF2M1Gv5z2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 22:49:14 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so525204a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744980550; x=1745585350; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hGm94WkSvEKAT80t6SgDIndlW5MDyMlulTb0cPlczvI=;
        b=NMMDwE4k9IeldGdqt/Tq50x6slrp/h8Q64B7qLz6jEZRNIXljUdBr3PQN0ZEceCY9C
         JGhZXb60GxnF6TufPYo8XWDdXqS7xyGwznNHoQILyKgiiJwHkwDB4p9fgH7JPNay55bK
         sL5C1G2mZ0Rz/1jW0jNtZ6boBpIufEitBCgvP0+sEAr6zTVhPo/gJqrgnsdpWzTYEkVL
         I1VZNc0v1aYYtASJL31RBu8cD2STgnA3c65uQzfbeMgN/2dkQFL4KSHFDbBCmxDp3Nd0
         qAU6s6Wdye71fV+u3NKUY2rj+bEbdTN+An4Rq67lNiap+Sg0IFze+vPa1opQb9GeNRWU
         62eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980550; x=1745585350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGm94WkSvEKAT80t6SgDIndlW5MDyMlulTb0cPlczvI=;
        b=BFlNG3Hg7+o1XaBgtQaf/b6kWSLWTCQCOHPVEpVCNz4VInqjS60yOKgrYSFGCLwO9W
         Soq7++GrZZcZpRlTO2aBkt6SY2qtuuRLvIvr0rK63V908cLZU/Z1njI6lVTOnJuOWqLe
         Q34J+xzns8gFUfPkgwu/1jEqodadauRj9VcOpVrOAute8x8WVBok+6zyYvf7irNaeDVK
         YBMroW+WRyJuIjCDV7TbvSq7ZIZSeqO6ZtqLMUUCd3eqZZO/bRSaH1AVNJpXaWA4RJSo
         hy/0KIqLIdS2WIGl1ZB9lifrCz7ZiU9QoWqy67Nfxhho5LP3JqON6SG3KRcf9vIbTsCv
         qi0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVvIZkUIvEfrLPrMYqoJI0bYQjA7x4YjVyF7QpD4Wgp9oqvk5MUfyUX8jwbZFgokoCTT/1qAD4TcgGSXY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzhbdZjeP3VfuH9SjEDtdaVrAAMbAhvAb55IVovF3OaTJ0QI1fU
	u3zwAYnZl+F6esyUMYZjrRUjL0rznEc02ABdYRTQKmJfNhlt7j8j
X-Gm-Gg: ASbGncsbxLs2Zp2rGZWiE1GB5LtoigIlv0QBQOJjgz/MqaqGmThj9lmxMpt1qBeAYkX
	lElP9ThpoqFBErTFVQ/d4lBOgPiIl4Uxr4jWm8F3L2kEzSp9/DuD9i/dzDjhnCenuO01o4D+WP4
	pFpE5P9209/nwqrBUxGd1+c7ghsEfQoCxZ2jMWMflJjyJQDu+uJti+SFGZCMOdsGNKZiY7F2Y9n
	G2P123oNY9sibqOqVN1T/txCysZlKPePhl6CVqhbyrKuLHiaA62Vi1As4duV0b+TZTOBJiMlo4N
	k9rNu9II1Qz+FDGPW7u8ismacD07
X-Google-Smtp-Source: AGHT+IGQJTO3hkOdi85KfZDP/WxTdVuBNdKLUzFgqgk61QYUOpAZhlXhZ2rXm1sjvZVBwnt5nJWcHg==
X-Received: by 2002:a05:6402:3513:b0:5e0:803c:242a with SMTP id 4fb4d7f45d1cf-5f62860d4afmr803363a12.8.1744980549365;
        Fri, 18 Apr 2025 05:49:09 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efadd0asm117605366b.175.2025.04.18.05.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:49:08 -0700 (PDT)
Date: Fri, 18 Apr 2025 15:49:05 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 01/14] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250418124905.2jve2cjzrojjwmyh@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
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
In-Reply-To: <20250411095752.3072696-2-wei.fang@nxp.com>
 <20250411095752.3072696-2-wei.fang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I see this is "Changes requested", so here are some more nitpicks from me.

On Fri, Apr 11, 2025 at 05:57:39PM +0800, Wei Fang wrote:
> Some NETC functionality is controlled using control messages sent to the
> hardware using BD ring interface with 32B descriptor similar to transmit
> BD ring used on ENETC. This BD ring interface is referred to as command
> BD ring. It is used to configure functionality where the underlying
> resources may be shared between different entities or being too large to
> configure using direct registers. Therefore, a messaging protocol called
> NETC Table Management Protocol (NTMP) is provided for exchanging
> configuration and management information between the software and the
> hardware using the command BD ring interface.
> 
> For i.MX95, NTMP has been upgraded to version 2.0, which is incompatible
> with LS1028A, because the message formats have been changed.

Can you please add one more sentence clarifying that the LS1028A
management protocol has been retroactively named NTMP 1.0 and its
implementation is in enetc_cbdr.c and enetc_tsn.c? The driver, like new
NETC documentation, refers to NTMP 2.0 as simply "NTMP".

> Therefore, add the netc-lib driver to support NTMP 2.0 to operate various tables.
> Note that, only MAC address filter table and RSS table are supported at
> the moment. More tables will be supported in subsequent patches.
> 
> It is worth mentioning that the purpose of the netc-lib driver is to
> provide some NTMP-based generic interfaces for ENETC and NETC Switch
> drivers. Currently, it only supports the configurations of some tables.
> Interfaces such as tc flower and debugfs will be added in the future.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
> +static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
> +{
> +	union netc_cbd *cur_cbd;
> +	struct netc_cbdr *cbdr;
> +	int i, err;
> +	u16 status;
> +	u32 val;
> +
> +	/* Currently only i.MX95 ENETC is supported, and it only has one
> +	 * command BD ring
> +	 */
> +	cbdr = &user->ring[0];
> +
> +	spin_lock_bh(&cbdr->ring_lock);
> +
> +	if (unlikely(!netc_get_free_cbd_num(cbdr)))
> +		netc_clean_cbdr(cbdr);
> +
> +	i = cbdr->next_to_use;
> +	cur_cbd = netc_get_cbd(cbdr, i);
> +	*cur_cbd = *cbd;
> +	dma_wmb();
> +
> +	/* Update producer index of both software and hardware */
> +	i = (i + 1) % cbdr->bd_num;
> +	cbdr->next_to_use = i;
> +	netc_write(cbdr->regs.pir, i);
> +
> +	err = read_poll_timeout_atomic(netc_read, val, val == i,
> +				       10, NETC_CBDR_TIMEOUT, true,

Please create a #define for NETC_CBDR_SLEEP_US too.

> +				       cbdr->regs.cir);
> +	if (unlikely(err))
> +		goto cbdr_unlock;
> +
> +	dma_rmb();
> +	/* Get the writeback command BD, because the caller may need
> +	 * to check some other fields of the response header.
> +	 */
> +	*cbd = *cur_cbd;
> +
> +	/* Check the writeback error status */
> +	status = le16_to_cpu(cbd->resp_hdr.error_rr) & NTMP_RESP_ERROR;
> +	if (unlikely(status)) {
> +		err = -EIO;
> +		dev_err(user->dev, "Command BD error: 0x%04x\n", status);
> +	}
> +
> +	netc_clean_cbdr(cbdr);
> +	dma_wmb();
> +
> +cbdr_unlock:
> +	spin_unlock_bh(&cbdr->ring_lock);
> +
> +	return err;
> +}
> +
> +static int ntmp_alloc_data_mem(struct ntmp_dma_buf *data, void **buf_align)
> +{
> +	void *buf;
> +
> +	buf = dma_alloc_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
> +				 &data->dma, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	data->buf = buf;
> +	*buf_align = PTR_ALIGN(buf, NTMP_DATA_ADDR_ALIGN);
> +
> +	return 0;
> +}
> +
> +static void ntmp_free_data_mem(struct ntmp_dma_buf *data)
> +{
> +	dma_free_coherent(data->dev, data->size + NTMP_DATA_ADDR_ALIGN,
> +			  data->buf, data->dma);
> +}
> +
> +static void ntmp_fill_request_hdr(union netc_cbd *cbd, dma_addr_t dma,
> +				  int len, int table_id, int cmd,
> +				  int access_method)
> +{
> +	dma_addr_t dma_align;
> +
> +	memset(cbd, 0, sizeof(*cbd));
> +	dma_align = ALIGN(dma, NTMP_DATA_ADDR_ALIGN);
> +	cbd->req_hdr.addr = cpu_to_le64(dma_align);
> +	cbd->req_hdr.len = cpu_to_le32(len);
> +	cbd->req_hdr.cmd = cmd;
> +	cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
> +						access_method);
> +	cbd->req_hdr.table_id = table_id;
> +	cbd->req_hdr.ver_cci_rr = FIELD_PREP(NTMP_HDR_VERSION,
> +					     NTMP_HDR_VER2);
> +	/* For NTMP version 2.0 or later version */
> +	cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
> +}
> +
> +static void ntmp_fill_crd(struct ntmp_cmn_req_data *crd, u8 tblv,
> +			  u8 qa, u16 ua)
> +{
> +	crd->update_act = cpu_to_le16(ua);
> +	crd->tblv_qact = NTMP_TBLV_QACT(tblv, qa);
> +}
> +
> +static void ntmp_fill_crd_eid(struct ntmp_req_by_eid *rbe, u8 tblv,
> +			      u8 qa, u16 ua, u32 entry_id)
> +{
> +	ntmp_fill_crd(&rbe->crd, tblv, qa, ua);
> +	rbe->entry_id = cpu_to_le32(entry_id);
> +}
> +
> +static int ntmp_delete_entry_by_id(struct ntmp_user *user, int tbl_id,
> +				   u8 tbl_ver, u32 entry_id, u32 req_len,
> +				   u32 resp_len)
> +{
> +	struct ntmp_dma_buf data = {.dev = user->dev};
> +	struct ntmp_req_by_eid *req;
> +	union netc_cbd cbd;
> +	u32 len;
> +	int err;
> +
> +	data.size = req_len >= resp_len ? req_len : resp_len;

max(req_len, resp_len)

It can also be placed as part of the "data" initializer:

	struct ntmp_dma_buf data = {
		.dev = user->dev,
		.size = max(req_len, resp_len),
	};

> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(req, tbl_ver, 0, 0, entry_id);
> +	len = NTMP_LEN(req_len, resp_len);
> +	ntmp_fill_request_hdr(&cbd, data.dma, len, tbl_id,
> +			      NTMP_CMD_DELETE, NTMP_AM_ENTRY_ID);
> +
> +	err = netc_xmit_ntmp_cmd(user, &cbd);
> +	if (err)
> +		dev_err(user->dev, "Delete table (id: %d) entry failed: %pe",
> +			tbl_id, ERR_PTR(err));

Could you also print the entry_id?

> +
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +
> +static int ntmp_query_entry_by_id(struct ntmp_user *user, int tbl_id,
> +				  u32 len, struct ntmp_req_by_eid *req,
> +				  dma_addr_t dma, bool compare_eid)
> +{
> +	struct device *dev = user->dev;
> +	struct ntmp_cmn_resp_query *resp;
> +	int cmd = NTMP_CMD_QUERY;
> +	union netc_cbd cbd;
> +	u32 entry_id;
> +	int err;
> +
> +	entry_id = le32_to_cpu(req->entry_id);
> +	if (le16_to_cpu(req->crd.update_act))
> +		cmd = NTMP_CMD_QU;
> +
> +	/* Request header */
> +	ntmp_fill_request_hdr(&cbd, dma, len, tbl_id, cmd, NTMP_AM_ENTRY_ID);
> +	err = netc_xmit_ntmp_cmd(user, &cbd);
> +	if (err) {
> +		dev_err(dev, "Query table (id: %d) entry failed: %pe\n",
> +			tbl_id, ERR_PTR(err));

Could you print a string representation of the tbl_id instead? It should
be more user-friendly if something fails.

static const char *ntmp_table_name(enum ntmp_tbl_id tbl_id)
{
	switch (tbl_id) {
	case NTMP_MAFT_ID:
		return "MAC Address Filtering";
	case NTMP_RSST_ID:
		return "RSS";
	default:
		return "unknown";
	}
}

Also, similar comment about entry_id being absent here.

> +		return err;
> +	}
> +
> +	/* For a few tables, the first field of their response data is not
> +	 * entry_id, so directly return success.
> +	 */
> +	if (!compare_eid)
> +		return 0;
> +
> +	resp = (struct ntmp_cmn_resp_query *)req;
> +	if (unlikely(le32_to_cpu(resp->entry_id) != entry_id)) {
> +		dev_err(dev, "Table (id: %d) query EID: 0x%x, response EID: 0x%x\n",
> +			tbl_id, entry_id, le32_to_cpu(resp->entry_id));
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +int ntmp_maft_add_entry(struct ntmp_user *user, u32 entry_id,
> +			struct maft_entry_data *maft)
> +{
> +	struct ntmp_dma_buf data = {.dev = user->dev};
> +	struct maft_req_add *req;
> +	union netc_cbd cbd;
> +	int err;
> +
> +	data.size = sizeof(*req);

Same comment about wrapping this into the struct initializer.

> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	/* Set mac address filter table request data buffer */
> +	ntmp_fill_crd_eid(&req->rbe, user->tbl.maft_ver, 0, 0, entry_id);
> +	req->keye = maft->keye;
> +	req->cfge = maft->cfge;
> +
> +	ntmp_fill_request_hdr(&cbd, data.dma, NTMP_LEN(data.size, 0),
> +			      NTMP_MAFT_ID, NTMP_CMD_ADD, NTMP_AM_ENTRY_ID);
> +	err = netc_xmit_ntmp_cmd(user, &cbd);
> +	if (err)
> +		dev_err(user->dev, "Add MAFT entry failed (%pe)\n",
> +			ERR_PTR(err));
> +
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_maft_add_entry);
> +
> +int ntmp_maft_query_entry(struct ntmp_user *user, u32 entry_id,
> +			  struct maft_entry_data *maft)
> +{
> +	struct ntmp_dma_buf data = {.dev = user->dev};
> +	struct maft_resp_query *resp;
> +	struct ntmp_req_by_eid *req;
> +	int err;
> +
> +	data.size = sizeof(*resp);

Same comment about struct initializer.

> +	err = ntmp_alloc_data_mem(&data, (void **)&req);
> +	if (err)
> +		return err;
> +
> +	ntmp_fill_crd_eid(req, user->tbl.maft_ver, 0, 0, entry_id);
> +	err = ntmp_query_entry_by_id(user, NTMP_MAFT_ID,
> +				     NTMP_LEN(sizeof(*req), data.size),
> +				     req, data.dma, true);
> +	if (err)
> +		goto end;
> +
> +	resp = (struct maft_resp_query *)req;
> +	maft->keye = resp->keye;
> +	maft->cfge = resp->cfge;
> +
> +end:
> +	ntmp_free_data_mem(&data);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(ntmp_maft_query_entry);

