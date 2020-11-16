Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1733E2B3D1F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 07:28:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZK0G385bzDqPk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 17:28:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=w+VZB+RO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZJy03yHzzDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 17:26:48 +1100 (AEDT)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB5C822265;
 Mon, 16 Nov 2020 06:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605508006;
 bh=KNxZNeUAdv9IfL6kzMaZDPBkNRCU/qmi8tHHcvDU2dY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w+VZB+ROmYrOHi2C8XFz27tSRHgMa1wAY6wtHml3gEeqlIEyWPhQrG1MEZFr3lLdn
 LWmBugHzAxuMSJ8N4p/AUnHV2L2n7c75u9wpcP7VjOHUiwWddFh56XKSJb2QdvTEcy
 rbxiVt/7BdmA1UdVfdeYW+lzmYKhvlcVqtbC60zI=
Date: Mon, 16 Nov 2020 00:26:39 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/3] Revert "lib: Revert use of fallthrough
 pseudo-keyword in lib/"
Message-ID: <20201116062639.GB7265@embeddedor>
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-3-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116043532.4032932-3-ndesaulniers@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 15, 2020 at 08:35:31PM -0800, Nick Desaulniers wrote:
> This reverts commit 6a9dc5fd6170 ("lib: Revert use of fallthrough
> pseudo-keyword in lib/")
> 
> Now that we can build arch/powerpc/boot/ free of -Wimplicit-fallthrough,
> re-enable these fixes for lib/.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.com>

Thanks
--
Gustavo

> ---
>  lib/asn1_decoder.c      |  4 ++--
>  lib/assoc_array.c       |  2 +-
>  lib/bootconfig.c        |  4 ++--
>  lib/cmdline.c           | 10 +++++-----
>  lib/dim/net_dim.c       |  2 +-
>  lib/dim/rdma_dim.c      |  4 ++--
>  lib/glob.c              |  2 +-
>  lib/siphash.c           | 36 ++++++++++++++++++------------------
>  lib/ts_fsm.c            |  2 +-
>  lib/vsprintf.c          | 14 +++++++-------
>  lib/xz/xz_dec_lzma2.c   |  4 ++--
>  lib/xz/xz_dec_stream.c  | 16 ++++++++--------
>  lib/zstd/bitstream.h    | 10 +++++-----
>  lib/zstd/compress.c     |  2 +-
>  lib/zstd/decompress.c   | 12 ++++++------
>  lib/zstd/huf_compress.c |  4 ++--
>  16 files changed, 64 insertions(+), 64 deletions(-)
> 
> diff --git a/lib/asn1_decoder.c b/lib/asn1_decoder.c
> index 58f72b25f8e9..13da529e2e72 100644
> --- a/lib/asn1_decoder.c
> +++ b/lib/asn1_decoder.c
> @@ -381,7 +381,7 @@ int asn1_ber_decoder(const struct asn1_decoder *decoder,
>  	case ASN1_OP_END_SET_ACT:
>  		if (unlikely(!(flags & FLAG_MATCHED)))
>  			goto tag_mismatch;
> -		/* fall through */
> +		fallthrough;
>  
>  	case ASN1_OP_END_SEQ:
>  	case ASN1_OP_END_SET_OF:
> @@ -448,7 +448,7 @@ int asn1_ber_decoder(const struct asn1_decoder *decoder,
>  			pc += asn1_op_lengths[op];
>  			goto next_op;
>  		}
> -		/* fall through */
> +		fallthrough;
>  
>  	case ASN1_OP_ACT:
>  		ret = actions[machine[pc + 1]](context, hdr, tag, data + tdp, len);
> diff --git a/lib/assoc_array.c b/lib/assoc_array.c
> index 6f4bcf524554..04c98799c3ba 100644
> --- a/lib/assoc_array.c
> +++ b/lib/assoc_array.c
> @@ -1113,7 +1113,7 @@ struct assoc_array_edit *assoc_array_delete(struct assoc_array *array,
>  						index_key))
>  				goto found_leaf;
>  		}
> -		/* fall through */
> +		fallthrough;
>  	case assoc_array_walk_tree_empty:
>  	case assoc_array_walk_found_wrong_shortcut:
>  	default:
> diff --git a/lib/bootconfig.c b/lib/bootconfig.c
> index 649ed44f199c..9f8c70a98fcf 100644
> --- a/lib/bootconfig.c
> +++ b/lib/bootconfig.c
> @@ -827,7 +827,7 @@ int __init xbc_init(char *buf, const char **emsg, int *epos)
>  							q - 2);
>  				break;
>  			}
> -			/* fall through */
> +			fallthrough;
>  		case '=':
>  			ret = xbc_parse_kv(&p, q, c);
>  			break;
> @@ -836,7 +836,7 @@ int __init xbc_init(char *buf, const char **emsg, int *epos)
>  			break;
>  		case '#':
>  			q = skip_comment(q);
> -			/* fall through */
> +			fallthrough;
>  		case ';':
>  		case '\n':
>  			ret = xbc_parse_key(&p, q);
> diff --git a/lib/cmdline.c b/lib/cmdline.c
> index 9e186234edc0..46f2cb4ce6d1 100644
> --- a/lib/cmdline.c
> +++ b/lib/cmdline.c
> @@ -144,23 +144,23 @@ unsigned long long memparse(const char *ptr, char **retptr)
>  	case 'E':
>  	case 'e':
>  		ret <<= 10;
> -		/* fall through */
> +		fallthrough;
>  	case 'P':
>  	case 'p':
>  		ret <<= 10;
> -		/* fall through */
> +		fallthrough;
>  	case 'T':
>  	case 't':
>  		ret <<= 10;
> -		/* fall through */
> +		fallthrough;
>  	case 'G':
>  	case 'g':
>  		ret <<= 10;
> -		/* fall through */
> +		fallthrough;
>  	case 'M':
>  	case 'm':
>  		ret <<= 10;
> -		/* fall through */
> +		fallthrough;
>  	case 'K':
>  	case 'k':
>  		ret <<= 10;
> diff --git a/lib/dim/net_dim.c b/lib/dim/net_dim.c
> index a4db51c21266..06811d866775 100644
> --- a/lib/dim/net_dim.c
> +++ b/lib/dim/net_dim.c
> @@ -233,7 +233,7 @@ void net_dim(struct dim *dim, struct dim_sample end_sample)
>  			schedule_work(&dim->work);
>  			break;
>  		}
> -		/* fall through */
> +		fallthrough;
>  	case DIM_START_MEASURE:
>  		dim_update_sample(end_sample.event_ctr, end_sample.pkt_ctr,
>  				  end_sample.byte_ctr, &dim->start_sample);
> diff --git a/lib/dim/rdma_dim.c b/lib/dim/rdma_dim.c
> index f7e26c7b4749..15462d54758d 100644
> --- a/lib/dim/rdma_dim.c
> +++ b/lib/dim/rdma_dim.c
> @@ -59,7 +59,7 @@ static bool rdma_dim_decision(struct dim_stats *curr_stats, struct dim *dim)
>  			break;
>  		case DIM_STATS_WORSE:
>  			dim_turn(dim);
> -			/* fall through */
> +			fallthrough;
>  		case DIM_STATS_BETTER:
>  			step_res = rdma_dim_step(dim);
>  			if (step_res == DIM_ON_EDGE)
> @@ -94,7 +94,7 @@ void rdma_dim(struct dim *dim, u64 completions)
>  			schedule_work(&dim->work);
>  			break;
>  		}
> -		/* fall through */
> +		fallthrough;
>  	case DIM_START_MEASURE:
>  		dim->state = DIM_MEASURE_IN_PROGRESS;
>  		dim_update_sample_with_comps(curr_sample->event_ctr, 0, 0,
> diff --git a/lib/glob.c b/lib/glob.c
> index 52e3ed7e4a9b..85ecbda45cd8 100644
> --- a/lib/glob.c
> +++ b/lib/glob.c
> @@ -102,7 +102,7 @@ bool __pure glob_match(char const *pat, char const *str)
>  			break;
>  		case '\\':
>  			d = *pat++;
> -			/* fall through */
> +			fallthrough;
>  		default:	/* Literal character */
>  literal:
>  			if (c == d) {
> diff --git a/lib/siphash.c b/lib/siphash.c
> index c47bb6ff2149..a90112ee72a1 100644
> --- a/lib/siphash.c
> +++ b/lib/siphash.c
> @@ -68,11 +68,11 @@ u64 __siphash_aligned(const void *data, size_t len, const siphash_key_t *key)
>  						  bytemask_from_count(left)));
>  #else
>  	switch (left) {
> -	case 7: b |= ((u64)end[6]) << 48; /* fall through */
> -	case 6: b |= ((u64)end[5]) << 40; /* fall through */
> -	case 5: b |= ((u64)end[4]) << 32; /* fall through */
> +	case 7: b |= ((u64)end[6]) << 48; fallthrough;
> +	case 6: b |= ((u64)end[5]) << 40; fallthrough;
> +	case 5: b |= ((u64)end[4]) << 32; fallthrough;
>  	case 4: b |= le32_to_cpup(data); break;
> -	case 3: b |= ((u64)end[2]) << 16; /* fall through */
> +	case 3: b |= ((u64)end[2]) << 16; fallthrough;
>  	case 2: b |= le16_to_cpup(data); break;
>  	case 1: b |= end[0];
>  	}
> @@ -101,11 +101,11 @@ u64 __siphash_unaligned(const void *data, size_t len, const siphash_key_t *key)
>  						  bytemask_from_count(left)));
>  #else
>  	switch (left) {
> -	case 7: b |= ((u64)end[6]) << 48; /* fall through */
> -	case 6: b |= ((u64)end[5]) << 40; /* fall through */
> -	case 5: b |= ((u64)end[4]) << 32; /* fall through */
> +	case 7: b |= ((u64)end[6]) << 48; fallthrough;
> +	case 6: b |= ((u64)end[5]) << 40; fallthrough;
> +	case 5: b |= ((u64)end[4]) << 32; fallthrough;
>  	case 4: b |= get_unaligned_le32(end); break;
> -	case 3: b |= ((u64)end[2]) << 16; /* fall through */
> +	case 3: b |= ((u64)end[2]) << 16; fallthrough;
>  	case 2: b |= get_unaligned_le16(end); break;
>  	case 1: b |= end[0];
>  	}
> @@ -268,11 +268,11 @@ u32 __hsiphash_aligned(const void *data, size_t len, const hsiphash_key_t *key)
>  						  bytemask_from_count(left)));
>  #else
>  	switch (left) {
> -	case 7: b |= ((u64)end[6]) << 48; /* fall through */
> -	case 6: b |= ((u64)end[5]) << 40; /* fall through */
> -	case 5: b |= ((u64)end[4]) << 32; /* fall through */
> +	case 7: b |= ((u64)end[6]) << 48; fallthrough;
> +	case 6: b |= ((u64)end[5]) << 40; fallthrough;
> +	case 5: b |= ((u64)end[4]) << 32; fallthrough;
>  	case 4: b |= le32_to_cpup(data); break;
> -	case 3: b |= ((u64)end[2]) << 16; /* fall through */
> +	case 3: b |= ((u64)end[2]) << 16; fallthrough;
>  	case 2: b |= le16_to_cpup(data); break;
>  	case 1: b |= end[0];
>  	}
> @@ -301,11 +301,11 @@ u32 __hsiphash_unaligned(const void *data, size_t len,
>  						  bytemask_from_count(left)));
>  #else
>  	switch (left) {
> -	case 7: b |= ((u64)end[6]) << 48; /* fall through */
> -	case 6: b |= ((u64)end[5]) << 40; /* fall through */
> -	case 5: b |= ((u64)end[4]) << 32; /* fall through */
> +	case 7: b |= ((u64)end[6]) << 48; fallthrough;
> +	case 6: b |= ((u64)end[5]) << 40; fallthrough;
> +	case 5: b |= ((u64)end[4]) << 32; fallthrough;
>  	case 4: b |= get_unaligned_le32(end); break;
> -	case 3: b |= ((u64)end[2]) << 16; /* fall through */
> +	case 3: b |= ((u64)end[2]) << 16; fallthrough;
>  	case 2: b |= get_unaligned_le16(end); break;
>  	case 1: b |= end[0];
>  	}
> @@ -431,7 +431,7 @@ u32 __hsiphash_aligned(const void *data, size_t len, const hsiphash_key_t *key)
>  		v0 ^= m;
>  	}
>  	switch (left) {
> -	case 3: b |= ((u32)end[2]) << 16; /* fall through */
> +	case 3: b |= ((u32)end[2]) << 16; fallthrough;
>  	case 2: b |= le16_to_cpup(data); break;
>  	case 1: b |= end[0];
>  	}
> @@ -454,7 +454,7 @@ u32 __hsiphash_unaligned(const void *data, size_t len,
>  		v0 ^= m;
>  	}
>  	switch (left) {
> -	case 3: b |= ((u32)end[2]) << 16; /* fall through */
> +	case 3: b |= ((u32)end[2]) << 16; fallthrough;
>  	case 2: b |= get_unaligned_le16(end); break;
>  	case 1: b |= end[0];
>  	}
> diff --git a/lib/ts_fsm.c b/lib/ts_fsm.c
> index ab749ec10ab5..64fd9015ad80 100644
> --- a/lib/ts_fsm.c
> +++ b/lib/ts_fsm.c
> @@ -193,7 +193,7 @@ static unsigned int fsm_find(struct ts_config *conf, struct ts_state *state)
>  				TOKEN_MISMATCH();
>  
>  			block_idx++;
> -			/* fall through */
> +			fallthrough;
>  
>  		case TS_FSM_ANY:
>  			if (next == NULL)
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 14c9a6af1b23..d3c5c16f391c 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1265,7 +1265,7 @@ char *mac_address_string(char *buf, char *end, u8 *addr,
>  
>  	case 'R':
>  		reversed = true;
> -		/* fall through */
> +		fallthrough;
>  
>  	default:
>  		separator = ':';
> @@ -1682,7 +1682,7 @@ char *uuid_string(char *buf, char *end, const u8 *addr,
>  	switch (*(++fmt)) {
>  	case 'L':
>  		uc = true;
> -		/* fall through */
> +		fallthrough;
>  	case 'l':
>  		index = guid_index;
>  		break;
> @@ -2219,7 +2219,7 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>  	case 'S':
>  	case 's':
>  		ptr = dereference_symbol_descriptor(ptr);
> -		/* fall through */
> +		fallthrough;
>  	case 'B':
>  		return symbol_string(buf, end, ptr, spec, fmt);
>  	case 'R':
> @@ -2450,7 +2450,7 @@ int format_decode(const char *fmt, struct printf_spec *spec)
>  
>  	case 'x':
>  		spec->flags |= SMALL;
> -		/* fall through */
> +		fallthrough;
>  
>  	case 'X':
>  		spec->base = 16;
> @@ -2468,7 +2468,7 @@ int format_decode(const char *fmt, struct printf_spec *spec)
>  		 * utility, treat it as any other invalid or
>  		 * unsupported format specifier.
>  		 */
> -		/* fall through */
> +		fallthrough;
>  
>  	default:
>  		WARN_ONCE(1, "Please remove unsupported %%%c in format string\n", *fmt);
> @@ -3411,10 +3411,10 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
>  			break;
>  		case 'i':
>  			base = 0;
> -			/* fall through */
> +			fallthrough;
>  		case 'd':
>  			is_sign = true;
> -			/* fall through */
> +			fallthrough;
>  		case 'u':
>  			break;
>  		case '%':
> diff --git a/lib/xz/xz_dec_lzma2.c b/lib/xz/xz_dec_lzma2.c
> index 65a1aad8c223..ca2603abee08 100644
> --- a/lib/xz/xz_dec_lzma2.c
> +++ b/lib/xz/xz_dec_lzma2.c
> @@ -1043,7 +1043,7 @@ XZ_EXTERN enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
>  
>  			s->lzma2.sequence = SEQ_LZMA_PREPARE;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_LZMA_PREPARE:
>  			if (s->lzma2.compressed < RC_INIT_BYTES)
> @@ -1055,7 +1055,7 @@ XZ_EXTERN enum xz_ret xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
>  			s->lzma2.compressed -= RC_INIT_BYTES;
>  			s->lzma2.sequence = SEQ_LZMA_RUN;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_LZMA_RUN:
>  			/*
> diff --git a/lib/xz/xz_dec_stream.c b/lib/xz/xz_dec_stream.c
> index 32ab2a08b7cb..fea86deaaa01 100644
> --- a/lib/xz/xz_dec_stream.c
> +++ b/lib/xz/xz_dec_stream.c
> @@ -583,7 +583,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
>  			if (ret != XZ_OK)
>  				return ret;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_BLOCK_START:
>  			/* We need one byte of input to continue. */
> @@ -608,7 +608,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
>  			s->temp.pos = 0;
>  			s->sequence = SEQ_BLOCK_HEADER;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_BLOCK_HEADER:
>  			if (!fill_temp(s, b))
> @@ -620,7 +620,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
>  
>  			s->sequence = SEQ_BLOCK_UNCOMPRESS;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_BLOCK_UNCOMPRESS:
>  			ret = dec_block(s, b);
> @@ -629,7 +629,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
>  
>  			s->sequence = SEQ_BLOCK_PADDING;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_BLOCK_PADDING:
>  			/*
> @@ -651,7 +651,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
>  
>  			s->sequence = SEQ_BLOCK_CHECK;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_BLOCK_CHECK:
>  			if (s->check_type == XZ_CHECK_CRC32) {
> @@ -675,7 +675,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
>  
>  			s->sequence = SEQ_INDEX_PADDING;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_INDEX_PADDING:
>  			while ((s->index.size + (b->in_pos - s->in_start))
> @@ -699,7 +699,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
>  
>  			s->sequence = SEQ_INDEX_CRC32;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_INDEX_CRC32:
>  			ret = crc32_validate(s, b);
> @@ -709,7 +709,7 @@ static enum xz_ret dec_main(struct xz_dec *s, struct xz_buf *b)
>  			s->temp.size = STREAM_HEADER_SIZE;
>  			s->sequence = SEQ_STREAM_FOOTER;
>  
> -			/* fall through */
> +			fallthrough;
>  
>  		case SEQ_STREAM_FOOTER:
>  			if (!fill_temp(s, b))
> diff --git a/lib/zstd/bitstream.h b/lib/zstd/bitstream.h
> index 3a49784d5c61..7c65c66e41fd 100644
> --- a/lib/zstd/bitstream.h
> +++ b/lib/zstd/bitstream.h
> @@ -259,15 +259,15 @@ ZSTD_STATIC size_t BIT_initDStream(BIT_DStream_t *bitD, const void *srcBuffer, s
>  		bitD->bitContainer = *(const BYTE *)(bitD->start);
>  		switch (srcSize) {
>  		case 7: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[6]) << (sizeof(bitD->bitContainer) * 8 - 16);
> -			/* fall through */
> +			fallthrough;
>  		case 6: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[5]) << (sizeof(bitD->bitContainer) * 8 - 24);
> -			/* fall through */
> +			fallthrough;
>  		case 5: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[4]) << (sizeof(bitD->bitContainer) * 8 - 32);
> -			/* fall through */
> +			fallthrough;
>  		case 4: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[3]) << 24;
> -			/* fall through */
> +			fallthrough;
>  		case 3: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[2]) << 16;
> -			/* fall through */
> +			fallthrough;
>  		case 2: bitD->bitContainer += (size_t)(((const BYTE *)(srcBuffer))[1]) << 8;
>  		default:;
>  		}
> diff --git a/lib/zstd/compress.c b/lib/zstd/compress.c
> index 5e0b67003e55..b080264ed3ad 100644
> --- a/lib/zstd/compress.c
> +++ b/lib/zstd/compress.c
> @@ -3182,7 +3182,7 @@ static size_t ZSTD_compressStream_generic(ZSTD_CStream *zcs, void *dst, size_t *
>  				zcs->outBuffFlushedSize = 0;
>  				zcs->stage = zcss_flush; /* pass-through to flush stage */
>  			}
> -			/* fall through */
> +			fallthrough;
>  
>  		case zcss_flush: {
>  			size_t const toFlush = zcs->outBuffContentSize - zcs->outBuffFlushedSize;
> diff --git a/lib/zstd/decompress.c b/lib/zstd/decompress.c
> index db6761ea4deb..66cd487a326a 100644
> --- a/lib/zstd/decompress.c
> +++ b/lib/zstd/decompress.c
> @@ -442,7 +442,7 @@ size_t ZSTD_decodeLiteralsBlock(ZSTD_DCtx *dctx, const void *src, size_t srcSize
>  		case set_repeat:
>  			if (dctx->litEntropy == 0)
>  				return ERROR(dictionary_corrupted);
> -			/* fall through */
> +			fallthrough;
>  		case set_compressed:
>  			if (srcSize < 5)
>  				return ERROR(corruption_detected); /* srcSize >= MIN_CBLOCK_SIZE == 3; here we need up to 5 for case 3 */
> @@ -1768,7 +1768,7 @@ size_t ZSTD_decompressContinue(ZSTD_DCtx *dctx, void *dst, size_t dstCapacity, c
>  			return 0;
>  		}
>  		dctx->expected = 0; /* not necessary to copy more */
> -		/* fall through */
> +		fallthrough;
>  
>  	case ZSTDds_decodeFrameHeader:
>  		memcpy(dctx->headerBuffer + ZSTD_frameHeaderSize_prefix, src, dctx->expected);
> @@ -2309,7 +2309,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
>  		switch (zds->stage) {
>  		case zdss_init:
>  			ZSTD_resetDStream(zds); /* transparent reset on starting decoding a new frame */
> -			/* fall through */
> +			fallthrough;
>  
>  		case zdss_loadHeader: {
>  			size_t const hSize = ZSTD_getFrameParams(&zds->fParams, zds->headerBuffer, zds->lhSize);
> @@ -2376,7 +2376,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
>  			}
>  			zds->stage = zdss_read;
>  		}
> -			/* fall through */
> +			fallthrough;
>  
>  		case zdss_read: {
>  			size_t const neededInSize = ZSTD_nextSrcSizeToDecompress(zds->dctx);
> @@ -2405,7 +2405,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
>  			zds->stage = zdss_load;
>  			/* pass-through */
>  		}
> -			/* fall through */
> +			fallthrough;
>  
>  		case zdss_load: {
>  			size_t const neededInSize = ZSTD_nextSrcSizeToDecompress(zds->dctx);
> @@ -2438,7 +2438,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
>  				/* pass-through */
>  			}
>  		}
> -			/* fall through */
> +			fallthrough;
>  
>  		case zdss_flush: {
>  			size_t const toFlushSize = zds->outEnd - zds->outStart;
> diff --git a/lib/zstd/huf_compress.c b/lib/zstd/huf_compress.c
> index e727812d12aa..08b4ae80aed4 100644
> --- a/lib/zstd/huf_compress.c
> +++ b/lib/zstd/huf_compress.c
> @@ -556,9 +556,9 @@ size_t HUF_compress1X_usingCTable(void *dst, size_t dstSize, const void *src, si
>  	n = srcSize & ~3; /* join to mod 4 */
>  	switch (srcSize & 3) {
>  	case 3: HUF_encodeSymbol(&bitC, ip[n + 2], CTable); HUF_FLUSHBITS_2(&bitC);
> -		/* fall through */
> +		fallthrough;
>  	case 2: HUF_encodeSymbol(&bitC, ip[n + 1], CTable); HUF_FLUSHBITS_1(&bitC);
> -		/* fall through */
> +		fallthrough;
>  	case 1: HUF_encodeSymbol(&bitC, ip[n + 0], CTable); HUF_FLUSHBITS(&bitC);
>  	case 0:
>  	default:;
> -- 
> 2.29.2.299.gdc1121823c-goog
> 
